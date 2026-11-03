# Changelog

All notable changes to Pigeon No Weapons In Vehicles are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project uses [Semantic Versioning](https://semver.org/spec/v2.0.0.html):

- **Major** versions can need changes to your configuration or other resources. Read the **Upgrade notes**.
- **Minor** versions add features without breaking existing setups.
- **Patch** versions fix bugs only.

## [Unreleased]

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

[Unreleased]: https://github.com/pigeon-studios-uk/pigeon-no-weapons-in-vehicles/compare/v1.0.0...HEAD
[1.0.0]: https://github.com/pigeon-studios-uk/pigeon-no-weapons-in-vehicles/releases/tag/v1.0.0
