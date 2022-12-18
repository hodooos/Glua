include('shared.lua')
--/ Responsive
local x, y = ScrW(), ScrH()

local function ChangeResponsive()
    x = ScrW()
    y = ScrH()
end
hook.Add("OnScreenSizeChanged", "Hodos:Responsive", ChangeResponsive)

--/ Fonts
surface.CreateFont("hodos_button", {
	font = "Circular Std Medium",
	size = 25,
	weight = 100
})

surface.CreateFont("hodos_main", {
	font = "Circular Std Medium",
	size = 40,
	weight = 400
})

surface.CreateFont("hodos_npc_title", {
	font = "HudNumbers",
	size = 140,
	weight = 600
})

local hodos_forum = Material("hodos_icons/forum.png")
local hodos_collection = Material("hodos_icons/steam.png")
local hodos_discord = Material("hodos_icons/discord.png")
local hodos_site = Material("hodos_icons/site.png")


--/ Frame
local function HodosNPCOpenFrame()
	local mainframe = vgui.Create("DFrame")
	mainframe:SetSize(x * 0.25, y * 0.28)
	mainframe:SetTitle("")
	mainframe:SetDraggable(true)
	mainframe:ShowCloseButton(false)
	mainframe:Center()
	mainframe:MakePopup()
	function mainframe:Paint(w, h)
		draw.RoundedBox(25, 0, 0, w, h, Color(249, 222, 201, 255))
		draw.DrawText("Votre Guide", "hodos_main", x * 0.085, y * 0.02, Color(0, 0, 0, 255))
		surface.SetMaterial(hodos_forum)
		surface.DrawTexturedRect(x * 0.175, y * 0.175, x * 0.02, y * 0.032)
		surface.SetMaterial(hodos_discord)
		surface.DrawTexturedRect(x * 0.175, y * 0.075, x * 0.02, y * 0.032)
		surface.SetMaterial(hodos_site)
		surface.DrawTexturedRect(x * 0.0575, y * 0.075, x * 0.02, y * 0.032)
		surface.SetMaterial(hodos_collection)
		surface.DrawTexturedRect(x * 0.0575, y * 0.175, x * 0.02, y * 0.032)
	end

	--/ Close Button:
	local closebutton = vgui.Create( "DButton", mainframe)
	closebutton:SetText("")
	closebutton:SetSize(x * 0.1, y * 0.04)
	closebutton:SetPos(x * 0.215, y * 0)
	function closebutton:Paint(w, h)
		draw.DrawText("×", "hodos_button", 25, 15, Color(0, 0, 0, 255))
	end
	closebutton.DoClick = function()
		mainframe:Close()				
	end

	--/ Site Button:
	local sitebutton = vgui.Create("DButton", mainframe)
	sitebutton:SetText("")
	sitebutton:SetSize(x * 0.1, y * 0.04)
	sitebutton:SetPos(x * 0.015, y * 0.11)
	function sitebutton:Paint(w, h)
		draw.RoundedBox(25, 0, 0, w, h, Color(58, 64, 90, 255))
		draw.DrawText("Site", "hodos_button", x * 0.04, y * 0.007, Color(255, 255, 255, 255))
	end
	sitebutton.DoClick = function()
		gui.OpenURL("https://ateria-community.com/forum")			
	end

	--/ Collection Button:
	local collectionbutton = vgui.Create("DButton", mainframe)
	collectionbutton:SetText("")
	collectionbutton:SetSize(x * 0.1, y * 0.04)
	collectionbutton:SetPos(x * 0.015, y * 0.21)
	function collectionbutton:Paint(w, h)
		draw.RoundedBox(25, 0, 0, w, h, Color(58, 64, 90, 255))
		draw.DrawText("Collection", "hodos_button", x * 0.025, y * 0.007, Color(255, 255, 255, 255))
	end
	collectionbutton.DoClick = function()
		gui.OpenURL("https://ateria-community.com/collection")			
	end

	--/ Discord Button:
	local discordbutton = vgui.Create("DButton", mainframe)
	discordbutton:SetText("")
	discordbutton:SetSize(x * 0.1, y * 0.04)
	discordbutton:SetPos(x * 0.135, y * 0.11)
	function discordbutton:Paint(w, h)
		draw.RoundedBox(25, 0, 0, w, h, Color(58, 64, 90, 255))
		draw.DrawText("Discord", "hodos_button", x * 0.033, y * 0.007, Color(255, 255, 255, 255))
	end
	discordbutton.DoClick = function()
		gui.OpenURL("https://discord.gg/ateria")			
	end

	--/ Forum Button:
	local forumbutton = vgui.Create("DButton", mainframe)
	forumbutton:SetText("")
	forumbutton:SetSize(x * 0.1, y * 0.04)
	forumbutton:SetPos(x * 0.135, y * 0.21)
	function forumbutton:Paint(w, h) 
		draw.RoundedBox(25, 0, 0, w, h, Color(58, 64, 90, 255))
		draw.DrawText("Forum", "hodos_button", x * 0.033, y * 0.007, Color(255, 255, 255, 255))
	end
	forumbutton.DoClick = function()
		gui.OpenURL("https://ateria-community.com/forum")			
	end
end

net.Receive("HodosNPCOpenFrame", HodosNPCOpenFrame) --/ Receive the net message from shared.lua

function ENT:Initialize()
end

function ENT:Draw()
	self:DrawModel()

	local Distance = LocalPlayer():GetPos():DistToSqr(self:GetPos())

	if Distance <= 250000 then
		local Pos = self:GetPos()
		local Ang = self:GetAngles()

		if Distance < 200000 then
			cam.Start3D2D(Pos + Vector(0, 0, TimedSin(.5, 84, 86, .5)), Angle(TimedSin(.5, 0, 10, 0), LocalPlayer():EyeAngles().y - 90, 90), .06)
				draw.SimpleText("Guide", "hodos_npc_title", 0, 0, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
			cam.End3D2D()
		end
	end
end