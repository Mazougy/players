addCommandHandler("respawn", function()
    triggerServerEvent("onPlayerRespawnRequest", localPlayer)
end)