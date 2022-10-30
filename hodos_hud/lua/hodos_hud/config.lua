--/ Ne touchez pas si vous ne savez pas pourquoi vous le faites.
HodosHUD = HodosHUD or {}

--/ Configuration de l'Hud
HodosHUD.Colors = {
    ["Armor"] = Color(75, 177, 250, 255),
    ["Life"] = Color(215, 68, 62, 255),
    ["Food"] = Color(174, 104, 52, 255),
    ["BackGround"] = Color(21, 21, 21, 90),
    ["Crosshair"] = Color(255, 255, 255, 255),
    ["Box"] = Color(255, 190, 100, 255),
    ["Weapon"] = Color(85, 85, 85, 255)
} --/ Permet de changer les couleurs de l'Hud.

HodosHUD.Configuration = {
    ["UseCrosshair"] = true, --/ Permet d'activer ou de désactiver le réticule de l'hud.
    ["UseArmor"] = true, --/ Permet d'activer ou de désactiver l'armure de l'hud.
    ["UseLife"] = true, --/ Permet d'activer ou de désactiver la vie de l'hud.
    ["UseFood"] = true, --/ Permet d'activer ou de désactiver la nourriture de l'hud.
    ["UseProps"] = true, --/ Permet d'activer ou de désactiver les props de l'hud.
    ["UseBullet"] = true --/ Permet d'activer ou de désactiver les munitions de l'hud.
}

HodosHUD.Fonts = "Circular Std Medium" --/ Permet de changer la police de l'écriture de l'hud.

HodosHUD.MaxProps = 85 --/ Permet de configurer le nombre de props autorisé sur votre serveur.