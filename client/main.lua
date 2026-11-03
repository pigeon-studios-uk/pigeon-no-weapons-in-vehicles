--[[
    Pigeon No Weapons In Vehicles: client.

    While the player sits in one of the configured vehicles, any weapon they take out is put away again
    and drive-bys are turned off. Outside those vehicles it only checks twice a second.
]]

local RESOURCE = GetCurrentResourceName()
local UNARMED = joaat('WEAPON_UNARMED')
local IDLE_MS = 500                      -- how often to check when not in a restricted vehicle
local SELECT_WEAPON = 37                 -- INPUT_SELECT_WEAPON: the weapon wheel

local strings = Locales[Config.Locale] or Locales.en
local vehicles, classes = {}, {}
local lastMessage = -math.huge
local driveByBlocked = false

for _, name in ipairs(Config.Vehicles or {}) do
    vehicles[joaat(name)] = true
end
for _, class in ipairs(Config.Classes or {}) do
    classes[class] = true
end

local function notify(text)
    local mode = Config.Notifications
    if mode == 'ox_lib' or (mode == 'auto' and GetResourceState('ox_lib') == 'started') then
        TriggerEvent('ox_lib:notify', { title = strings.title, description = text, type = 'error' })
    else
        BeginTextCommandThefeedPost('STRING')
        AddTextComponentSubstringPlayerName(text)
        EndTextCommandThefeedPostTicker(false, false)
    end
end

--- True if the player's seat in this vehicle is one the rules cover.
local function seatCovered(vehicle, ped)
    local seats = Config.Seats or 'all'
    if seats == 'all' then return true end
    local driving = GetPedInVehicleSeat(vehicle, -1) == ped
    if seats == 'driver' then return driving end
    return not driving
end

local function isRestricted(vehicle, ped)
    if vehicle == 0 then return false end
    if not (vehicles[GetEntityModel(vehicle)] or classes[GetVehicleClass(vehicle)]) then return false end
    return seatCovered(vehicle, ped)
end

local function setDriveBy(allowed)
    SetPlayerCanDoDriveBy(PlayerId(), allowed)
    driveByBlocked = not allowed
end

local function holster(ped)
    if GetSelectedPedWeapon(ped) == UNARMED then return end

    if GetResourceState('ox_inventory') == 'started' then
        TriggerEvent('ox_inventory:disarm', true)
    end
    SetCurrentPedWeapon(ped, UNARMED, true)

    if Config.ShowMessage then
        local now = GetGameTimer()
        if now - lastMessage >= (Config.MessageCooldown or 5) * 1000 then
            lastMessage = now
            notify(strings.holstered)
        end
    end
end

CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local vehicle = IsPedInAnyVehicle(ped, false) and GetVehiclePedIsIn(ped, false) or 0

        if isRestricted(vehicle, ped) then
            if Config.BlockDriveBy and not driveByBlocked then setDriveBy(false) end
            if Config.Holster then
                DisableControlAction(0, SELECT_WEAPON, true)
                holster(ped)
            end
            Wait(0)
        else
            if driveByBlocked then setDriveBy(true) end
            Wait(IDLE_MS)
        end
    end
end)

AddEventHandler('onResourceStop', function(resource)
    if resource == RESOURCE and driveByBlocked then setDriveBy(true) end
end)
