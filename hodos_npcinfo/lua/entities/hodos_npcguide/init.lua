AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')

util.AddNetworkString("HodosNPCOpenFrame")

function ENT:Initialize()
	self:SetModel("models/Humans/Group01/Male_04.mdl") 
	self:SetHullType(HULL_HUMAN) 
	self:SetHullSizeNormal() 
	self:SetNPCState(NPC_STATE_SCRIPT) 
	self:SetSolid(SOLID_BBOX) 
	self:CapabilitiesAdd(CAP_ANIMATEDFACE) 
	self:SetUseType(SIMPLE_USE) 
	self:DropToFloor() 
	self:SetMaxYawSpeed(90) 
end

function ENT:AcceptInput(name, activator, caller)
  if name == "Use" and caller:IsPlayer() then 
    net.Start("HodosNPCOpenFrame") 
    net.Send(caller) 
  end
end