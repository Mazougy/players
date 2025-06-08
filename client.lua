addCommandHandler("respawn",function()
    local Player = getPlayerName(localPlayer)
    
    setElementPosition(localPlayer,0,8,0)
    outputChatBox(Player.." successfully respawned")
end)