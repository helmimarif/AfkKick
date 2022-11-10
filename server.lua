RegisterServerEvent("kickForBeingAnAFK")
AddEventHandler("kickForBeingAnAFK", function()
	DropPlayer(source, "Kamu AFK terlalu lama.")
end)
