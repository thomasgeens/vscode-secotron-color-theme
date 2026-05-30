# Change Log

All notable changes to the "secotron-color-theme" extension will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [1.2.0](https://github.com/thomasgeens/vscode-secotron-color-theme/compare/v1.1.1...v1.2.0) (2026-05-30)


### Features

* **ci:** add job summaries to CI, Publish, and Pre-release workflows ([f9b8580](https://github.com/thomasgeens/vscode-secotron-color-theme/commit/f9b858096d6424a42ba0cae634ab68275d0b1db9))
* **theme:** add SECOTRON Dark and SECOTRON Light variants ([ee1abdc](https://github.com/thomasgeens/vscode-secotron-color-theme/commit/ee1abdc0cb8dbe912e776bcb41b069a39abbfe78))


### Bug Fixes

* **ci:** exclude auto-generated CHANGELOG.md from markdownlint and prettier ([350f9d2](https://github.com/thomasgeens/vscode-secotron-color-theme/commit/350f9d2af4677014d86419c80882a5f96563172f))
* **ci:** use PAT for release-please so PR triggers CI workflows ([43567b6](https://github.com/thomasgeens/vscode-secotron-color-theme/commit/43567b6599952d018c1f6cea1a2e45beb6eb2994))
* **package:** align version to 1.1.0 matching release-please manifest ([21193c3](https://github.com/thomasgeens/vscode-secotron-color-theme/commit/21193c3db8df63568320f9c04dffc5dddc7ebab1))
* **release:** advance past v1.1.1 for release-please ([b78f604](https://github.com/thomasgeens/vscode-secotron-color-theme/commit/b78f6042b05586338526aa5e826cbf57404ce98d))

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
