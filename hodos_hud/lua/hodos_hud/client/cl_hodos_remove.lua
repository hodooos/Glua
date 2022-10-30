-- Cacher l'HUD de base
local hodoshudhide = {
	["DarkRP_HUD"] = true,
	["DarkRP_EntityDisplay"] = false,
	["DarkRP_ZombieInfo"] = false,
    ["DarkRP_PlayerInfo"] = false,
	["DarkRP_LocalPlayerHUD"] = true,
	["DarkRP_Agenda"] = false,
	["DarkRP_Hungermod"] = true,
	["CHudHealth"] = true,
	["CHudBattery"] = true,
	["CHudSuitPower"] = true,
	["CHudAmmo"] = true,
	["CHudSecondaryAmmo"] = true,
    ["CHudCrosshair"] = true
}

hook.Add("HUDShouldDraw", "hodoshudhide:HUD", function(name)
	if hodoshudhide[name] then return false end
end)