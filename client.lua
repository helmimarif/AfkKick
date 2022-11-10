--AFK Kick Time Limit (in seconds)
secondsUntilKick = 300

--Warn players if 3/4 of the Time Limit is up
kickWarning = true

Citizen.CreateThread(function()
	while true do
		Wait(1000)

		playerPed = GetPlayerPed(-1)
		if playerPed then
			currentPos = GetEntityCoords(playerPed, true)

			if currentPos == prevPos then
				if time > 0 then
					if kickWarning and time == math.ceil(secondsUntilKick / 4) then
						TriggerEvent("chatMessage", "PERINGATAN", {255, 0, 0}, "^1Kamu akan dikick dari server dalam " .. time .. " detik karena AFK!")
					end

					time = time - 1
				else
					TriggerServerEvent("kickForBeingAnAFK")
				end
			else
				time = secondsUntilKick
			end

			prevPos = currentPos
		end
	end
end)
