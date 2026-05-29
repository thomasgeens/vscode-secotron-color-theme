# Change Log

All notable changes to the "secotron-color-theme" extension will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [1.1.1](https://github.com/thomasgeens/vscode-secotron-color-theme/compare/v1.1.0...v1.1.1) (2026-05-29)


### Bug Fixes

* **ci:** add packages key to release-please config for header/footer override ([1e0efde](https://github.com/thomasgeens/vscode-secotron-color-theme/commit/1e0efde86257de5a8c47041e60220aa17ce3f138))
* **package:** update .vscodeignore to exclude all dev/CI files from VSIX ([2d43cd2](https://github.com/thomasgeens/vscode-secotron-color-theme/commit/2d43cd240ad912c68094512a1c832cfbd7eb9fa7))
* **package:** use allowlist .vscodeignore — exclude everything by default ([bdf296d](https://github.com/thomasgeens/vscode-secotron-color-theme/commit/bdf296d201c3683bc13daf9255f4f79630d30972))
* **release:** trigger release-please for v1.1.1 ([08130a4](https://github.com/thomasgeens/vscode-secotron-color-theme/commit/08130a48580bf5f81ac1134be72b0ce5e1c1ed96))

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
