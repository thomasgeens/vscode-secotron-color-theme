# Change Log

All notable changes to the "secotron-color-theme" extension will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [1.1.0](https://github.com/thomasgeens/vscode-secotron-color-theme/compare/v1.0.8...v1.1.0) (2026-05-29)


### Features

* **ci:** add release-please workflow for automated releases ([f5f5b24](https://github.com/thomasgeens/vscode-secotron-color-theme/commit/f5f5b24d2f6c71be760d1fb949fb97991f72d8e6))
* **dx:** add dev and install-ext Makefile targets ([1cc35d5](https://github.com/thomasgeens/vscode-secotron-color-theme/commit/1cc35d51ecfd11aa74ba6f42b57b63664e322ab6))
* **quality:** add trunk code quality + update devDeps ([e7e36cc](https://github.com/thomasgeens/vscode-secotron-color-theme/commit/e7e36cc804b9fd78b2c60cc3a3ef09642fbd2c1e))
* **release:** add pre-release publishing via PR label ([46c143b](https://github.com/thomasgeens/vscode-secotron-color-theme/commit/46c143bfe326ec6d5eea0d096afc62ac08befa59))


### Bug Fixes

* **deps:** replace incorrect package-lock.json with correct one for secotron-color-theme ([1f9dc10](https://github.com/thomasgeens/vscode-secotron-color-theme/commit/1f9dc105ba7b5013689513c65c369193ede589f8))
* **lint:** bump eslintrc ecmaVersion 2018→2022 + reformat ([c3128a8](https://github.com/thomasgeens/vscode-secotron-color-theme/commit/c3128a8cce7dfab88d7b1b259b290a2cfd5bd581))
* **release:** set manifest to 1.1.0 to unblock release-please ([ace53eb](https://github.com/thomasgeens/vscode-secotron-color-theme/commit/ace53eb24cfe1d2631ae9d578c493ad5292f1ba5))

## [1.0.8] - 2021-05-20

### Changed

- Changed foregroundcolor keyword, storage, storage.type, entity.name.tag.css in code editor from "#30638e" to "#709eb8" for better readability.

## [1.0.7] - 2021-04-28

### Fixed

- Fixed json parsing error within color-theme.json.

## [1.0.6] - 2021-04-28

### Changed

- Changed foregroundcolor for functions in code editor from "#437C90" to "#5fb0ce" for better readability.
- Changed "terminal.ansiBrightBlack" color from "#666666" to "#888888" for better readability.

## [1.0.5] - 2020-05-06

### Changed

- Changed "terminal.ansiBrightBlack" color from "#333333" to "#666666" for better readability.

## [1.0.4] - 2020-05-05

### Changed

- Lowered minimum Visual Studio Code version requirements for the Color Theme Extension from 1.44.0 to 1.0.0

## [1.0.3] - 2020-05-04

### Fixed

- Fixed bug in which exension didn't show up anymore as a Theme. This was due to the 'main' tag being wrongly added to the Extension Manifest.

## [1.0.2] - 2020-05-04

### Fixed

- Fixed a bug in which images weren't shown in the README.md File by adding the baseImagesUrl option to the VSCE Package Command. Used the Azure Devops API this time to make sure images are correctly shown. (e.g. "https://dev.azure.com/$organization/$projectName/_apis/git/repositories/$repoName/items?download=true&api-version=5.0&path=%2f$filePath")

## [1.0.1] - 2020-05-04

### Fixed

- Fixed a bug in which images weren't shown in the README.md File by adding the baseImagesUrl option to the VSCE Package Command

## [1.0.0] - 2020-05-04

### Added

- Added extra tags to the Extension's manifest
- Added Author information to the Extension's manifest
- Added CHANGELOG.md

### Changed

- Updated README.md with Color Wheel and Example images

## [Unreleased]

## [0.0.1] - 2020-05-02

- Initial release
