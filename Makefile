GREEN  := \033[0;32m
YELLOW := \033[0;33m
RED    := \033[0;31m
NC     := \033[0m

.PHONY: all setup brew install test lint fmt package clean help

all: help

# One-time setup: install tools and activate repo-local git aliases
setup: brew
	@echo "${YELLOW}Activating repo-local git aliases...${NC}"
	@git config --local include.path ../.gitconfig
	@echo "${GREEN}Done. Git aliases from .gitconfig are now active.${NC}"

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
	@echo "  package   build .vsix with vsce"
	@echo "  clean     remove node_modules, *.vsix, build artifacts"
