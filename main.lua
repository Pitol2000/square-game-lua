require "collision"

function love.load()
    player = {}
    player.w = 60
    player.h = 60
    player.x = 800/2 - player.w/2
    player.y = 600/2 - player.h/2

    coin = {}
    coin.x = 100
    coin.y = 100
    coin.w = 30
    coin.h = 30

    math.randomseed(os.time())
end

function love.update(dt)
    if love.keyboard.isDown("right") and player.x < 799 - player.w then
        player.x = player.x + 500 * dt
    end
    if love.keyboard.isDown("left") and player.x > 1 then
        player.x = player.x - 500 * dt
    end
    if love.keyboard.isDown("up") and player.y > 1 then
        player.y = player.y - 500 * dt
    end
    if love.keyboard.isDown("down") and player.y < 599 - player.h then
        player.y = player.y + 500 * dt
    end

    if AABB(player.x, player.y, player.w, player.h, coin.x, coin.y, coin.w, coin.h) then
        coin.x = math.random(0, 800 - coin.w)
        coin.y = math.random(0, 600 - coin.h)
    end
end

function love.draw()
    -- player
    love.graphics.setColor(255, 0, 0)
    love.graphics.rectangle("fill", player.x, player.y, player.w, player.h)

    -- coin
    love.graphics.setColor(255, 255, 0)
    love.graphics.rectangle("fill", coin.x, coin.y, coin.w, coin.h)

end
