Config = {}

-- Language for the text players see. 'auto' follows ox_lib's language (setr ox:locale "de" in
-- server.cfg) and is English when that isn't set. Or name a file from locales/, such as 'de' or 'pt-br'.
Config.Locale = 'auto'

---------------------------------------------------------------------------
-- Which vehicles

-- Vehicles where weapons stay holstered, by spawn name (the name you'd use to spawn it, not the name
-- shown in game). Add-on vehicles work the same way. The police Maverick is here as an example.
Config.Vehicles = {
    'polmav',
}

-- Whole vehicle classes where weapons stay holstered, as well as the vehicles above. Use {} for none.
-- 8 motorcycles · 13 cycles · 14 boats · 15 helicopters · 16 planes · 17 service (buses, taxis)
-- · 18 emergency · 19 military · 21 trains. The full list: https://docs.fivem.net/natives/?_0x29439776AAA00A62
Config.Classes = {}

-- Which seats it applies to: 'all', 'driver' or 'passengers'.
Config.Seats = 'all'

---------------------------------------------------------------------------
-- What happens

-- Put away any weapon a player has out, as soon as they're in the vehicle, and keep it away. If
-- ox_inventory is running it's asked to holster the weapon, so its own records stay correct.
Config.Holster = true

-- Stop players aiming and shooting from the vehicle (drive-bys), including with the weapon they'd
-- already put away. Their ability to do drive-bys comes back when they get out.
Config.BlockDriveBy = true

-- Tell the player why their weapon was put away. They're told at most once every
-- Config.MessageCooldown seconds.
Config.ShowMessage = true
Config.MessageCooldown = 5

-- How the message is shown.
-- 'auto' uses ox_lib notifications if ox_lib is running, otherwise GTA's notification feed.
-- 'ox_lib' or 'gta' to force one.
Config.Notifications = 'auto'

-- Update checks are controlled in server.cfg for every Pigeon Studios resource at once:
--     set pigeon_update_check "on"      (default)  |  "quiet"  |  "off"
