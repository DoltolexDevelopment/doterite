local player = {}
scale = 4

-- The player's "model", so to say.
player.image = 0
player.width = 16 * scale
player.height = 16 * scale

-- Player coords
player.coords = {}
player.coords.x = 400 - 32
player.coords.y = 600 - 80

-- Shooting

-- Cooldown
player.cooldown = 20
player.dots = {}
function player.launch()
    if player.cooldown <= 0 then
        player.cooldown = 20
        dot = {}
        dot.width = 8
        dot.height = 8
        dot.x = player.coords.x + 54
        dot.y = player.coords.y + 2
        table.insert(player.dots, dot)
    end
end
-- Functions
function player.draw()
    -- Draws the actual player
    love.graphics.rectangle("fill", player.coords.x, player.coords.y, player.width, player.height)
    
    -- Shooting
    for _, d in pairs(player.dots) do
        love.graphics.rectangle("fill", d.x, d.y, d.width, d.height)
    end
end

function player.update(dt)
    if love.keyboard.isDown("space") then
        player.launch()
    end
end
return player
