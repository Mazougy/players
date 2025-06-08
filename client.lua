addCommandHandler("respawn", function()
    local Player = getPlayerName(localPlayer)

    setElementPosition(localPlayer, 0, 0, 5)

    local money = getPlayerMoney(localPlayer)

    setPlayerMoney(money + 1500)

    outputChatBox(Player .. " successfully respawned")
end)
