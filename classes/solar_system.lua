local System = require("classes.system")

local SolarSystem = {}
SolarSystem.__index = SolarSystem
setmetatable(SolarSystem, {__index = System})

function SolarSystem:new(world, planets, minRadius, maxRadius, maxAttempts)
    local instance = System:new(world, "planet", minRadius, maxRadius, maxAttempts)
    setmetatable(instance, SolarSystem)
    
    instance.type = "solar_system"

    if type(planets) == "number" then
        instance:generateSystem(planets)
    else -- assuming it's a snapshot
        instance:loadSnapshot(planets, world)
    end

    return instance
end

function SolarSystem:generateSystem(numPlanets)
    -- place sun in center
    local m = math.random(1.5, 3)
    self:addBody(0, 0, self.maxRadius*m, self.maxRadius*m, true)

    self:addBodies(numPlanets, 2)
end

return SolarSystem