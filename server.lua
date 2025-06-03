addEventHandler("onPlayerJoin", root, function()
    local db = exports.db:getConnection()
    local name = getPlayerName(source)
    local qh = dbQuery(db, "SELECT * FROM player WHERE name = ?", name)
    local result = dbPoll(qh, -1)
    if result and #result > 0 then
        local player = result[1]
        local rotation = math.floor(player.rotation)
        outputChatBox(rotation .. " has spawned!")
        spawnPlayer(source, player.x, player.y, player.z, rotation, player.skin, player.interior, player.dimension)
    else
        spawnPlayer(source, 0, 0, 5, 0)
        local skin = math.random(0, 288)
        setElementModel(source, skin)
        local x, y, z = getElementPosition(source)
        local rx, ry, rz = getElementRotation(source)
        local interior = getElementInterior(source)
        local dimension = getElementDimension(source)
        dbExec(db, "INSERT INTO player(name,skin,x,y,z,rotation,interior,dimension) VALUES(?,?,?,?,?,?,?,?)", name, skin,
            x, y, z, rz,
            interior, dimension)
    end
    fadeCamera(source, true)
    setCameraTarget(source, source)
    outputChatBox(name .. " has spawned!")
    local player = source
    dbQuery(function(queryHandle)
        local results = dbPoll(queryHandle, -1)
        if isElement(player) and results and results[1] then
            setElementData(player, 'id', results[1].id)
        end
    end, db, "SELECT id From player WHERE name = ? ORDER BY id DESC LIMIT 1", name)
end)




addEventHandler("onPlayerQuit", root, function()
    local db = exports.db:getConnection()
    local name = getPlayerName(source)
    local x, y, z = getElementPosition(source)
    local _, _, rz = getElementRotation(source)
    local interior = getElementInterior(source)
    local dimension = getElementDimension(source)
    local success = dbExec(db,
        "UPDATE player SET x = ?,y = ?,z = ?,rotation = ?,interior = ?,dimension = ? WHERE  name =?", x, y, z, rz,
        interior, dimension, name)
    if not success then
        outputDebugString("Failed to update data for player: " .. name)
    end
end)
