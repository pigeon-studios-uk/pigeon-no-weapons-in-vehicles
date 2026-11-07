# Changelog

All notable changes to Pigeon No Weapons In Vehicles are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project uses [Semantic Versioning](https://semver.org/spec/v2.0.0.html):

- **Major** versions can need changes to your configuration or other resources. Read the **Upgrade notes**.
- **Minor** versions add features without breaking existing setups.
- **Patch** versions fix bugs only.

## [Unreleased]

## [1.1.0] - 2026-11-07

### Added

- 22 more languages, so it now comes in 23: Czech, Danish, German, Spanish, Estonian, Finnish, French, Croatian, Hungarian, Indonesian, Italian, Dutch, Norwegian, Polish, Portuguese, Brazilian Portuguese, Romanian, Slovenian, Swedish, Turkish, and Simplified and Traditional Chinese.
- `Config.Locale = 'auto'`, the new default: it follows ox_lib's language (`setr ox:locale "de"` in `server.cfg`) and is English when that isn't set. A config that already says `'en'` stays in English.

## [1.0.0] - 2026-11-03

First release.

### Highlights

- Weapons stay holstered in the vehicles you list
- Restrict by spawn name or whole vehicle class
- No drive-bys, back to normal on getting out
- Works with ox_inventory

### Added

- Restricted vehicles by spawn name (`Config.Vehicles`, add-on vehicles included) and by vehicle class (`Config.Classes`), for every seat, the driver or passengers.
- Weapons put away on getting in and kept away, with the weapon wheel blocked inside. ox_inventory is asked to holster the weapon if it's running.
- Drive-bys turned off inside, and back on when the player gets out or the resource stops.
- A message telling the player why, at most once every `Config.MessageCooldown` seconds, through ox_lib if it's running or GTA's notification feed.
- English text in `locales/`.
- Update checker from the Pigeon Studios version registry.

[Unreleased]: https://github.com/pigeon-studios-uk/pigeon-no-weapons-in-vehicles/compare/v1.1.0...HEAD
[1.1.0]: https://github.com/pigeon-studios-uk/pigeon-no-weapons-in-vehicles/releases/tag/v1.1.0
[1.0.0]: https://github.com/pigeon-studios-uk/pigeon-no-weapons-in-vehicles/releases/tag/v1.0.0
