--/ Ne touchez pas si vous ne savez pas pourquoi vous le faites.
HodosHUD = HodosHUD or {}
MsgC(Color(255, 255, 255), [[hodos... yeah ? You fine ?]])
--/ Function
local function inc(f) return include("hodos_hud/"..f) end
local function addcs(f) return AddCSLuaFile("hodos_hud/"..f) end

--/ Core
if SERVER then
    addcs("config.lua")
    inc("config.lua")
    addcs("client/cl_hodos_hud.lua")
    addcs("client/cl_hodos_remove.lua")
else
    inc("config.lua")
    inc("client/cl_hodos_remove.lua")
    inc("client/cl_hodos_hud.lua")
end

print("Yes i'm fine c:")