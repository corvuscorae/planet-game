local Settings = require("utils.settings") 
local ShuffleBag = require("classes.shufflebag")
local loops = require("assets.loops")
local colors = {
    {1, 0.5, 0.4},  -- pink
    {1, 0.7, 0.4},  -- light orange
    {1, 0.9, 0.4},  -- light yellow
    {0.4, 1, 0.7},  -- greenish-blue
    {0.4, 1.7, 1},  -- light blue
    {0.5, 0.4, 1}   -- periwinkle
}
local colorBag = ShuffleBag.new(colors)
local loopBag = ShuffleBag.new(loops)

local width, height = Settings.width, Settings.height

-- CLASS ---
local Solar = {}
Solar.__index = Solar

function Solar:new(world, planets, minRadius, maxRadius, maxAttempts)
    local instance = {
        index = index,
        system = {}
    }
    setmetatable(instance, Solar)

    if type(planets) == "number" then
        instance:generateSystem(world, planets, minRadius, maxRadius, maxAttempts)
    else -- assuming it's a snapshot
        instance:load(planets, world)
    end

    return instance
end

function Solar:generateSystem(world, numPlanets, minRadius, maxRadius, maxAttempts)
    -- place sun in center
    self:addPlanet(world, 0, 0, maxRadius*2, maxRadius*2, true)
    
    for i = 2, numPlanets do
        local placed = false
        local attempts = 0
    
        while not placed and attempts < maxAttempts do
            attempts = attempts + 1
    
            local angle = math.random() * 2 * math.pi
            local dist = math.random(100, 250)
            local x = width / 2 + math.cos(angle) * dist
            local y = height / 2 + math.sin(angle) * dist
            
            local tooClose = false
    
            for _, other in ipairs(self.system) do
                local ox, oy = other.body:getPosition()
                local dx = x - ox
                local dy = y - oy
                local dSq = dx * dx + dy * dy
                if dSq < (maxRadius * 2)^2 then
                    tooClose = true
                    break
                end
            end
    
            if not tooClose then
                self:addPlanet(world, angle, dist, minRadius, maxRadius)
                placed = true
            end
        end
    
        if not placed then
            print("couldn't place planet " .. i .. " without overlap after " .. maxAttempts .. " attempts.")
        end
    end
end

function Solar:activatePlanet(planet)
    --if(planet.sun) then return end
    if not planet.sun and not self.system[1].alive then return end -- sun not active

    if (love.timer.getTime() - planet.activationTime) < 0.02 then
        love.graphics.setColor(1, 0.5, 0.1, 0.8)
        love.graphics.circle("fill", planet.body:getX(), planet.body:getY(), 5*planet.shape:getRadius())
    else
        -- Play loop
        if not planet.loop:isPlaying() then
            planet.loop:setVolume(0.7)
            planet.loop:setLooping(true)
            love.audio.play(planet.loop)
        end

        if not planet.alive then
            print("planet " .. planet.fixture:getUserData().index .. " activated")
            planet.alive = true
        end
    end
end

function Solar:snapshot()
    local s = {}
    for i, planet in ipairs(self.system) do
        s[i] = {
            alive = planet.alive,
            shape = planet.shape ,
            color = planet.color,
            loop = planet.loop,
            sun = planet.sun,
            angle = planet.angle,
            dist = planet.dist,
            radius = planet.radius,
            rotationSpeed = planet.rotationSpeed,
            activationTime = planet.activationTime
        }
    end

    return s
end

function Solar:load(snapshot, world)
    for i, p in ipairs(snapshot) do
        local planet = {}

        planet.alive = p.alive
        planet.shape = p.shape 
        planet.color = p.color
        planet.loop = p.loop
        planet.sun = p.sun
        planet.angle = p.angle
        planet.dist = p.dist
        planet.radius = p.radius
        planet.rotationSpeed = p.rotationSpeed 

        local x = width / 2 + math.cos(p.angle) * p.dist
        local y = height / 2 + math.sin(p.angle) * p.dist

        local bodyType = p.sun and "static" or "dynamic"

        planet.body = love.physics.newBody(world, x, y, bodyType)
        planet.fixture = love.physics.newFixture(planet.body, planet.shape)

        planet.activationTime = p.activationTime 

        table.insert(self.system, planet)
        planet.fixture:setUserData({ id="planet", index=#self.system })
    end
end

function Solar:clearPlanets()
    for _, planet in ipairs(self.system) do
        if planet.fixture and not planet.fixture:isDestroyed() then
                planet.fixture:destroy()
        end
        if planet.body and not planet.body:isDestroyed() then
            planet.body:destroy()
        end
    end
    self.system = {}
end

function Solar:resetPlanets()
    for _, planet in ipairs(self.system) do
        planet.alive = false
        planet.activationTime = null
    end
end

function Solar:movePlanet(planet, dt)
    planet.angle = planet.angle + planet.rotationSpeed * dt

    local x = width / 2 + math.cos(planet.angle) * planet.dist
    local y = height / 2 + math.sin(planet.angle) * planet.dist

    planet.body:setPosition(x,y)
end

function Solar:addPlanet(world, angle, dist, minRadius, maxRadius, isSun)
    local forceColor = isSun and {1,1,1} or nil

    local bodyType = isSun and "static" or "dynamic"

    local x = width / 2 + math.cos(angle) * dist
    local y = height / 2 + math.sin(angle) * dist

    local radius = love.math.random(minRadius, maxRadius)

    local planet = {}

    planet.alive = false
    
    planet.color = forceColor or colorBag:next()
    planet.loop = loopBag:next()
    planet.sun = isSun
    planet.angle = angle
    planet.dist = dist
    planet.radius = radius
    planet.shape = love.physics.newCircleShape(radius)
    planet.rotationSpeed = radius / 150 
    planet.activationTime = nil

    planet.body = love.physics.newBody(world, x, y, bodyType)
    planet.fixture = love.physics.newFixture(planet.body, planet.shape)

    table.insert(self.system, planet)
    planet.fixture:setUserData({ id="planet", index=#self.system })
end

function Solar:getGrey(color)
    local grey = (color[1] + color[2] + color[3]) / 3
    return {grey, grey, grey}    
end

return Solar
