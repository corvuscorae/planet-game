local H = require("utils.helpers")
local Body = {}
Body.__index = Body

function Body:new(config, position, state)
    local instance = {}
    setmetatable(instance, Body)
    
    -- initial state
    instance.alive = state and state.alive or false 
    instance.activationTime = state and state.activationTime or nil
    instance.core = config.isCore  -- central body?

    -- physics
    instance.body = love.physics.newBody(
        config.world,
        position.x,
        position.y,
        config.type
    )

    instance.radius = position.radius

    instance.shape = love.physics.newCircleShape(position.radius)
    instance.fixture = love.physics.newFixture(instance.body, instance.shape)
    if config.mask then
        instance.fixture:setCategory(config.mask)
        instance.fixture:setMask(config.mask)
    end

    return instance
end

function Body:render()
    if self.rendering and self.rendering.func and self.rendering.args then
        H.execute(self.rendering.func, self.rendering.args)
    else
        print("Error: Invalid rendering function.")
    end
end

return Body