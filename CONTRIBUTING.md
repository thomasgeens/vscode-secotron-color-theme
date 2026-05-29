# Contributing

## Local setup

```bash
git clone https://github.com/thomasgeens/vscode-secotron-color-theme
cd vscode-secotron-color-theme
make setup       # brew bundle + git aliases + .envrc.local scaffold + direnv allow
make install     # npm ci
```

Edit `.envrc.local` and set `VSCE_PAT` before publishing (see [Secrets](#secrets)).

## Development

| Command                       | What it does                                                                  |
| ----------------------------- | ----------------------------------------------------------------------------- |
| `make dev`                    | Open Extension Development Host — theme loaded live from source, no packaging |
| `make dev CODE=code-insiders` | Same, using VS Code Insiders                                                  |
| `make test`                   | Run jest tests (theme JSON validation)                                        |
| `make lint`                   | Run trunk check on all files                                                  |
| `make fmt`                    | Auto-format all files with trunk                                              |
| `make package`                | Build `.vsix` locally                                                         |
| `make install-ext`            | Build and install `.vsix` permanently into VS Code                            |

## Commit convention

This repo uses [Conventional Commits](https://www.conventionalcommits.org/).
release-please reads commit messages to determine version bumps and generate the changelog.

| Prefix                        | Version bump          | Example                                        |
| ----------------------------- | --------------------- | ---------------------------------------------- |
| `fix:`                        | patch (1.0.8 → 1.0.9) | `fix(theme): correct sidebar background color` |
| `feat:`                       | minor (1.0.8 → 1.1.0) | `feat(theme): add high-contrast token colors`  |
| `feat!:` / `BREAKING CHANGE:` | major (1.0.8 → 2.0.0) | `feat!: redesign full color palette`           |
| `chore:`, `docs:`, `ci:`      | none                  | no release triggered                           |

## Release flow

```
push commits to main (conventional commits)
  └─ release-please opens/updates Release PR "chore(main): release x.y.z"
       └─ add label 'pre-release'
            └─ Pre-release workflow publishes x.y.z as pre-release to marketplace
                 └─ test in VS Code: Extensions → ··· → Install Pre-Release Version
       └─ merge Release PR when satisfied
            └─ Publish workflow publishes x.y.z as stable + creates GitHub Release with VSIX
```

**Rules:**

- Never manually bump version or create tags — release-please handles this
- The `pre-release` label can be added multiple times as you iterate; each label event re-publishes
- Merging the Release PR always publishes stable, regardless of whether you published a pre-release first

## CI workflows

| Workflow             | Trigger                  | What it does                                               |
| -------------------- | ------------------------ | ---------------------------------------------------------- |
| `ci.yml`             | push / PR to `main`      | Install, test, package VSIX, upload artifact               |
| `trunk.yml`          | push / PR to `main`      | Lint and format check (trunk check)                        |
| `release-please.yml` | push to `main`           | Opens/updates Release PR, creates tag on merge             |
| `publish.yml`        | push of `v*` tag         | Publishes stable to marketplace + GitHub Release with VSIX |
| `prerelease.yml`     | PR labeled `pre-release` | Publishes pre-release to marketplace from PR branch        |

## Secrets

`VSCE_PAT` is required for publishing. It is a Personal Access Token scoped to **Marketplace → Manage**.

**In CI:** stored as a GitHub Actions secret (`Settings → Secrets → Actions → VSCE_PAT`).

**Locally:** set in `.envrc.local` (gitignored, never committed):

```bash
cp .envrc.local.example .envrc.local
# edit .envrc.local and set VSCE_PAT="your-token"
```

Create a PAT at `https://dev.azure.com` → User Settings → Personal Access Tokens.
Required scope: **Marketplace → Manage**.
