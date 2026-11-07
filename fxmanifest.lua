fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'pigeon-no-weapons-in-vehicles'
author 'Pigeon Studios'
description 'Keeps weapons holstered in the vehicles you choose, such as police helicopters or buses.'
version '1.1.0'
repository 'https://github.com/pigeon-studios-uk/pigeon-no-weapons-in-vehicles'

-- Pigeon Studios version registry entry, read by server/version_check.lua.
pigeon_slug 'pigeon-no-weapons-in-vehicles'

client_scripts {
    'configuration/config.lua',
    'locales/*.lua',
    'client/main.lua',
}

server_scripts {
    'server/version_check.lua',
}
