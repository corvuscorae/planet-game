local Settings = require("utils.settings") 

--------------------------------------------------
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
--------------------------------------------------

local width, height = Settings.width, Settings.height

-- CLASS ---
local System = {}
System.__index = System

function System:new(world, bodyType, minRadius, maxRadius, maxAttempts, mask)
    local instance = {
        index = index,
        system = {}
    }
    setmetatable(instance, System)

    self.world = world
    self.bodyType = bodyType
    self.minRadius = minRadius or 3
    self.maxRadius = maxRadius or 10
    self.maxAttempts = maxAttempts or 1000
    self.mask = mask

    return instance
end

function System:generateSystem(numBodies, startIndex, allCore) -- allCore is a temp fix to force all bodies to be static
    self:addBodies(numBodies, startIndex, allCore)
end

function System:addBodies(numBodies, startIndex, allCore)
    if not startIndex then startIndex = 1 end

    for i = startIndex, numBodies do
        local placed = false
        local attempts = 0
    
        while not placed and attempts < self.maxAttempts do
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
                if dSq < (self.maxRadius * 2)^2 then
                    tooClose = true
                    break
                end
            end
    
            if not tooClose then
                self:addBody(angle, dist, self.minRadius, self.maxRadius, allCore or false)
                placed = true
            end
        end
    
        if not placed then
            print("couldn't place " .. self.bodyType .. " " .. i .. " without overlap after " .. self.maxAttempts .. " attempts.")
        end
    end
end

function System:addBody(angle, dist, min, max, isCore)
    local forceColor = isCore and {1,1,1} or nil

    local bodyType = isCore and "static" or "dynamic"

    local x = width / 2 + math.cos(angle) * dist
    local y = height / 2 + math.sin(angle) * dist

    local radius = love.math.random(min, max)

    local body = {}

    body.alive = false
    
    body.color = forceColor or colorBag:next()
    body.loop = loopBag:next()
    body.core = isCore
    body.angle = angle
    body.dist = dist
    body.radius = radius
    body.shape = love.physics.newCircleShape(radius)
    body.rotationSpeed = radius / 150 
    body.activationTime = nil

    body.body = love.physics.newBody(self.world, x, y, bodyType)
    body.fixture = love.physics.newFixture(body.body, body.shape)
    if self.mask then 
        body.fixture:setCategory(self.mask) 
        body.fixture:setMask(self.mask) 
    end

    print(self.bodyType, self.mask)

    table.insert(self.system, body)
    body.fixture:setUserData({ id=self.bodyType, index=#self.system })
end

function System:activateBody(body, overrideCore)
    -- requires system's core to be active to proceed (unless override flag is on)
    if not overrideCore and (not body.core and not self.system[1].alive) then return end 

    if (love.timer.getTime() - body.activationTime) < 0.02 then
        love.graphics.setColor(1, 0.5, 0.1, 0.8)
        love.graphics.circle("fill", body.body:getX(), body.body:getY(), 5*body.shape:getRadius())
    else
        -- Play loop
        if not body.loop:isPlaying() then
            body.loop:setVolume(0.7)
            body.loop:setLooping(true)
            love.audio.play(body.loop)
        end

        if not body.alive then
            body.alive = true
        end
    end
end

function System:snapshot()
    local s = {}
    for i, body in ipairs(self.system) do
        s[i] = {
            alive = body.alive,
            shape = body.shape ,
            color = body.color,
            loop = body.loop,
            sun = body.core,
            angle = body.angle,
            dist = body.dist,
            radius = body.radius,
            rotationSpeed = body.rotationSpeed,
            activationTime = body.activationTime
        }
    end

    return s
end

function System:loadSnapshot(snapshot)
    for i, b in ipairs(snapshot) do
        local body = {}

        body.alive = b.alive
        body.shape = b.shape 
        body.color = b.color
        body.loop = b.loop
        body.core = b.core
        body.angle = b.angle
        body.dist = b.dist
        body.radius = b.radius
        body.rotationSpeed = b.rotationSpeed 

        local x = width / 2 + math.cos(b.angle) * b.dist
        local y = height / 2 + math.sin(b.angle) * b.dist

        local bodyType = b.core and "static" or "dynamic"

        body.body = love.physics.newBody(self.world, x, y, bodyType)
        body.fixture = love.physics.newFixture(body.body, body.shape)

        body.activationTime = b.activationTime 

        table.insert(self.system, body)
        body.fixture:setUserData({ id=self.bodyType, index=#self.system })
    end
end

function System:clearBodies()
    for _, body in ipairs(self.system) do
        if body.fixture and not body.fixture:isDestroyed() then
                body.fixture:destroy()
        end
        if body.body and not body.body:isDestroyed() then
            body.body:destroy()
        end
    end
    self.system = {}
end

function System:resetBodies()
    for _, body in ipairs(self.system) do
        body.alive = false
        body.activationTime = null
    end
end

function System:moveBody(body, dt)
    body.angle = body.angle + body.rotationSpeed * dt

    local x = width / 2 + math.cos(body.angle) * body.dist
    local y = height / 2 + math.sin(body.angle) * body.dist

    body.body:setPosition(x,y)
end

function System:getGrey(color)
    local grey = (color[1] + color[2] + color[3]) / 3
    return {grey, grey, grey}    
end

return System
