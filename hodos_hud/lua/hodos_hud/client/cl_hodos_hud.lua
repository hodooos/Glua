--/ Responsive
local x, y = ScrW(), ScrH()

hook.Add("OnScreenSizeChanged", "HodosHUD:Responsive", function()
    x = ScrW()
    y = ScrH()
end)

--/ Circle
function draw.Circle( x, y, radius, seg )
	local cir = {}

	table.insert( cir, { x = x, y = y, u = 0.5, v = 0.5 } )
	for i = 0, seg do
		local a = math.rad( ( i / seg ) * -360 )
		table.insert( cir, { x = x + math.sin( a ) * radius, y = y + math.cos( a ) * radius, u = math.sin( a ) / 2 + 0.5, v = math.cos( a ) / 2 + 0.5 } )
	end

	local a = math.rad( 0 ) -- This is needed for non absolute segment counts
	table.insert( cir, { x = x + math.sin( a ) * radius, y = y + math.cos( a ) * radius, u = math.sin( a ) / 2 + 0.5, v = math.cos( a ) / 2 + 0.5 } )

	surface.DrawPoly( cir )
end

--/ Fonts
surface.CreateFont("hodoshud_main", {
	font = HodosHUD.Fonts,
	size = 20,
	weight = 20
})

--/ Icon du HUD
local hodoshudarmor = Material("hodos_icons/armor.png")
local hodoshudlife = Material("hodos_icons/life.png")
local hodoshudfood = Material("hodos_icons/food.png")
local hodoshudbox = Material("hodos_icons/box.png")
local hodoshudweapon = Material("hodos_icons/weapon.png")

--/ Début HUD
hook.Add( "HUDPaint", "hodos_hud", function()
local ply = LocalPlayer()
local life = math.Clamp(ply:Health(), 0, 100)
local armor = math.Clamp(ply:Armor(), 0, 200)
local food = math.Clamp(ply:getDarkRPVar("Energy"), 0, 100)
local props = ply:GetCount("props")

--/ Crosshair
if HodosHUD.Configuration["UseCrosshair"] == true then
	surface.SetDrawColor(HodosHUD.Colors["Crosshair"])
	draw.Circle(x*0.4996, y*0.4994, x*0.0022, y*0.01)
end

--/ Armor
if HodosHUD.Configuration["UseArmor"] == true then
	if armor == 0 then else
		draw.RoundedBox(25, x*0.048, y*0.84, x*0.18, y*0.03, HodosHUD.Colors["BackGround"])
		draw.RoundedBox(25, x*0.048, y*0.84, x*armor*0.0018, y*0.03, HodosHUD.Colors["Armor"])
		draw.SimpleText(armor .. " " .. "/" .. " " .. "100", "hodoshud_main", x*0.12, y*0.845, color_white)
		surface.SetMaterial(hodoshudarmor)
		surface.DrawTexturedRect(x*0.02, y*0.84, x*0.017, y*0.03)
	end
end

--/ Life
if HodosHUD.Configuration["UseLife"] == true then
	draw.RoundedBox(25, x*0.048, y*0.89, x*0.18, y*0.03, HodosHUD.Colors["BackGround"])
	draw.RoundedBox(25, x*0.048, y*0.89, x*life*0.0018, y*0.03, HodosHUD.Colors["Life"])
	draw.SimpleText(life .. " " .. "/" .. " " .. "100", "hodoshud_main", x*0.12, y*0.895, color_white)
	surface.SetMaterial(hodoshudlife)
	surface.DrawTexturedRect(x*0.02, y*0.89, x*0.017, y*0.03)
end

--/ Food
if HodosHUD.Configuration["UseFood"] == true then
	draw.RoundedBox(25, x*0.048, y*0.94, x*0.18, y*0.03, HodosHUD.Colors["BackGround"])
	draw.RoundedBox(25, x*0.048, y*0.94, x*food*0.0018, y*0.03, HodosHUD.Colors["Food"])
	draw.SimpleText(food  .. " " .. "/" .. " " .. "100", "hodoshud_main", x*0.12, y*0.945, color_white)
	surface.SetMaterial(hodoshudfood)
	surface.DrawTexturedRect(x*0.02, y*0.94, x*0.017, y*0.03)
end

--/ Props
if HodosHUD.Configuration["UseProps"] == true then
	if props >= 1 then
		draw.RoundedBox(25, x*0.048, y*0.03, x*0.09, y*0.03, HodosHUD.Colors["Box"])
		draw.SimpleText(props .. " / " .. HodosHUD.MaxProps, "hodoshud_main", x*0.08, y*0.035, color_white)
		surface.SetMaterial(hodoshudbox)
		surface.DrawTexturedRect(x*0.02, y*0.03, x*0.017, y*0.03)
	end
end

--/ Munitions
if HodosHUD.Configuration["UseBullet"] == true then
	if IsValid(ply:GetActiveWeapon()) then
		if ply:GetActiveWeapon():Clip1() >= 0 then
			draw.RoundedBox(25, x*0.86, y*0.94, x*0.09, y*0.03, HodosHUD.Colors["Weapon"])
			draw.SimpleText(ply:GetActiveWeapon():Clip1().." / "..ply:GetAmmoCount(ply:GetActiveWeapon():GetPrimaryAmmoType()), "hodoshud_main", x*0.897, y*0.945, color_white)
			surface.SetMaterial(hodoshudweapon)
			surface.DrawTexturedRect(x*0.965, y*0.94, x*0.017, y*0.03)
		end
	end
end)
