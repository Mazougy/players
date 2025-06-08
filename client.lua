addCommandHandler("respawn", function()
    local Player = getPlayerName(localPlayer)

    setElementPosition(localPlayer, 1, 5, 0)

    local money = getPlayerMoney(localPlayer)

    setPlayerMoney(money + 1500, true)

    outputChatBox(Player .. " successfully respawned")
end)
