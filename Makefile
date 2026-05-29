GREEN  := \033[0;32m
YELLOW := \033[0;33m
RED    := \033[0;31m
NC     := \033[0m

# Override with CODE=code-insiders to use VS Code Insiders
CODE ?= code

.PHONY: all setup brew install test lint fmt package prerelease dev install-ext clean help

all: help

# One-time setup: install tools, activate git aliases, scaffold local secrets
setup: brew
	@echo "${YELLOW}Activating repo-local git aliases...${NC}"
	@git config --local include.path ../.gitconfig
	@if [ ! -f .envrc.local ]; then \
		cp .envrc.local.example .envrc.local; \
		echo "${YELLOW}Created .envrc.local — fill in VSCE_PAT before publishing.${NC}"; \
	fi
	@direnv allow 2>/dev/null || true
	@echo "${GREEN}Done.${NC}"

# Install required tools via Homebrew
brew:
	@echo "${YELLOW}Installing tools via Homebrew...${NC}"
	@brew bundle
	@echo "${GREEN}Done.${NC}"

install:
	@echo "${YELLOW}Installing dependencies...${NC}"
	@npm ci
	@echo "${GREEN}Done.${NC}"

test:
	@echo "${YELLOW}Running tests...${NC}"
	@npm test
	@echo "${GREEN}Done.${NC}"

lint:
	@echo "${YELLOW}Running trunk check...${NC}"
	@trunk check --all
	@echo "${GREEN}Done.${NC}"

fmt:
	@echo "${YELLOW}Formatting all files...${NC}"
	@trunk fmt --all
	@echo "${GREEN}Done.${NC}"

package:
	@echo "${YELLOW}Packaging VSIX...${NC}"
	@npx @vscode/vsce package
	@echo "${GREEN}Done.${NC}"

# Publish a pre-release to the marketplace (requires VSCE_PAT env var)
# In CI: add the 'pre-release' label to the release-please PR instead
prerelease:
	@echo "${YELLOW}Publishing pre-release to marketplace...${NC}"
	@npx @vscode/vsce publish --pre-release -p $$VSCE_PAT
	@echo "${GREEN}Done.${NC}"

# Open an Extension Development Host window with the theme loaded from source
dev:
	@echo "${YELLOW}Launching Extension Development Host ($(CODE))...${NC}"
	@$(CODE) --extensionDevelopmentPath=$(CURDIR)
	@echo "${GREEN}VS Code opened — switch theme to SECOTRON to preview.${NC}"

# Package and install the extension permanently into VS Code
install-ext: package
	@echo "${YELLOW}Installing extension into $(CODE)...${NC}"
	@$(CODE) --install-extension $(shell ls -t *.vsix | head -1)
	@echo "${GREEN}Done. Reload VS Code to activate.${NC}"

clean:
	@echo "${YELLOW}Cleaning...${NC}"
	@rm -rf node_modules/ *.vsix out/ dist/
	@echo "${GREEN}Done.${NC}"

help:
	@echo "SECOTRON Color Theme — available targets:"
	@echo ""
	@echo "  setup     one-time clone setup: brew bundle + activate git aliases"
	@echo "  brew      install tools via Homebrew (brew bundle)"
	@echo "  install   npm ci"
	@echo "  test      run jest tests"
	@echo "  lint      trunk check --all"
	@echo "  fmt       trunk fmt --all"
	@echo "  package      build .vsix with vsce"
	@echo "  prerelease   publish pre-release to marketplace (needs VSCE_PAT env var)"
	@echo "  dev          open Extension Development Host (live from source)"
	@echo "  install-ext  package + install VSIX permanently into VS Code"
	@echo "  clean        remove node_modules, *.vsix, build artifacts"
	@echo ""
	@echo "  CODE=code-insiders  use VS Code Insiders for dev/install-ext targets"
	@echo ""
	@echo "Release flow:"
	@echo "  1. Push commits to main (use conventional commits)"
	@echo "  2. release-please opens a Release PR with version bumped"
	@echo "  3. Add label 'pre-release' to the PR → CI publishes pre-release"
	@echo "  4. Test in VS Code (opt-in to pre-release for this extension)"
	@echo "  5. Merge the PR → CI publishes stable release"
