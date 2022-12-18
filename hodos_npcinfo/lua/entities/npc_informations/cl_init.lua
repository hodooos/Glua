include('shared.lua')
HODOSNPCINFOS = HODOSNPCINFOS or {}
--/ Responsive
local x, y = ScrW(), ScrH()

local function ChangeResponsive()
    x = ScrW()
    y = ScrH()
end
hook.Add("OnScreenSizeChanged", "Hodos:Responsive", ChangeResponsive)

--/ Configuration:
HODOSNPCINFOS.Colors = {
	["BackGround"] = Color(249, 222, 201, 255),
	["Button"] = Color(58, 64, 90, 255),
	["Text_Title"] = Color(255, 255, 255, 255),
	["Text_Button"] = Color(249, 222, 201, 255),
	["Text_Title_NPC"] = Color(255, 255, 255, 255)
} --/ Colors

HODOSNPCINFOS.Url = {
	["Forum"] = "https://forum.hodos.fr/",
	["Collection"] = "https://steamcommunity.com/sharedfiles/filedetails/?id=2410000000",
	["Discord"] = "https://discord.gg/4Z5Y4Z8",
	["Site"] = "https://hodos.fr/"
} --/ Url

HODOSNPCINFOS.Sprite = {
	["Forum"] = Material("hodos_icons/forum.png"),
	["Collection"] = Material("hodos_icons/steam.png"),
	["Discord"] = Material("hodos_icons/discord.png"),
	["Site"] = Material("hodos_icons/site.png")
} --/ Sprite

---/ End of configuration


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

--/ Sprite
local hodos_forum = HODOSNPCINFOS.Sprite["Forum"]
local hodos_collection = HODOSNPCINFOS.Sprite["Collection"]
local hodos_discord = HODOSNPCINFOS.Sprite["Discord"]
local hodos_site = HODOSNPCINFOS.Sprite["Site"]

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
		draw.RoundedBox(25, 0, 0, w, h, HODOSNPCINFOS.Colors["BackGround"])
		draw.DrawText("Votre Guide", "hodos_main", x * 0.085, y * 0.02, HODOSNPCINFOS.Colors["Text_Title"])
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
		draw.DrawText("×", "hodos_button", 25, 15, HODOSNPCINFOS.Colors["Text_Title"])
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
		draw.RoundedBox(25, 0, 0, w, h, HODOSNPCINFOS.Colors["Button"])
		draw.DrawText("Site", "hodos_button", x * 0.04, y * 0.007, HODOSNPCINFOS.Colors["Text_Button"])
	end
	sitebutton.DoClick = function()
		gui.OpenURL(HODOSNPCINFOS.Url["Site"])			
	end

	--/ Collection Button:
	local collectionbutton = vgui.Create("DButton", mainframe)
	collectionbutton:SetText("")
	collectionbutton:SetSize(x * 0.1, y * 0.04)
	collectionbutton:SetPos(x * 0.015, y * 0.21)
	function collectionbutton:Paint(w, h)
		draw.RoundedBox(25, 0, 0, w, h, HODOSNPCINFOS.Colors["Button"])
		draw.DrawText("Collection", "hodos_button", x * 0.025, y * 0.007, HODOSNPCINFOS.Colors["Text_Button"])
	end
	collectionbutton.DoClick = function()
		gui.OpenURL(HODOSNPCINFOS.Url["Collection"])			
	end

	--/ Discord Button:
	local discordbutton = vgui.Create("DButton", mainframe)
	discordbutton:SetText("")
	discordbutton:SetSize(x * 0.1, y * 0.04)
	discordbutton:SetPos(x * 0.135, y * 0.11)
	function discordbutton:Paint(w, h)
		draw.RoundedBox(25, 0, 0, w, h, HODOSNPCINFOS.Colors["Button"])
		draw.DrawText("Discord", "hodos_button", x * 0.033, y * 0.007, HODOSNPCINFOS.Colors["Text_Button"])
	end
	discordbutton.DoClick = function()
		gui.OpenURL(HODOSNPCINFOS.Url["Discord"])			
	end

	--/ Forum Button:
	local forumbutton = vgui.Create("DButton", mainframe)
	forumbutton:SetText("")
	forumbutton:SetSize(x * 0.1, y * 0.04)
	forumbutton:SetPos(x * 0.135, y * 0.21)
	function forumbutton:Paint(w, h) 
		draw.RoundedBox(25, 0, 0, w, h, HODOSNPCINFOS.Colors["Button"])
		draw.DrawText("Forum", "hodos_button", x * 0.033, y * 0.007, HODOSNPCINFOS.Colors["Text_Button"])
	end
	forumbutton.DoClick = function()
		gui.OpenURL(HODOSNPCINFOS.Url["Forum"])			
	end
end

net.Receive("HodosNPCOpenFrame", HodosNPCOpenFrame) --/ Receive the net message from shared.lua

function ENT:Draw()
	self:DrawModel()

	local Distance = LocalPlayer():GetPos():DistToSqr(self:GetPos())

	if Distance <= 250000 then
		local Pos = self:GetPos()
		local Ang = self:GetAngles()

		if Distance < 200000 then
			cam.Start3D2D(Pos + Vector(0, 0, TimedSin(.5, 84, 86, .5)), Angle(TimedSin(.5, 0, 10, 0), LocalPlayer():EyeAngles().y - 90, 90), .06)
				draw.SimpleText("Guide", "hodos_npc_title", 0, 0, HODOSNPCINFOS.Colors["Text_Title_NPC"], TEXT_ALIGN_CENTER)
			cam.End3D2D()
		end
	end
end
