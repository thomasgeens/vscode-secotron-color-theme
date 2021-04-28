# Change Log

All notable changes to the "secotron-color-theme" extension will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [1.0.7] - 2021-04-28
### Fixed
- Fixed json parsing error within color-theme.json.

## [1.0.6] - 2021-04-28
### Changed
- Changed foregroundcolor for functions in code editor from "#437C90" to "#5fb0ce" for better readability.
- Changed "terminal.ansiBrightBlack" color from "#666666" to "#888888" for better readability.
## [1.0.5] - 2020-05-06
### Changed
- Changed "terminal.ansiBrightBlack" color from  "#333333" to "#666666" for better readability.

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

# [Unreleased]
## [0.0.1] - 2020-05-02
- Initial release
