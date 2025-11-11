local System = require("classes.world.system")
local Description = require("classes.description")
local songs = require("assets.songs._tags")
local Body = require("classes.world.body")
local Settings = require("utils.settings") 
local width, height = Settings.width, Settings.height

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

local Galaxy = {}
Galaxy.__index = Galaxy
setmetatable(Galaxy, {__index = System})

function Galaxy:new(world, config, index, minRadius, maxRadius, mask)
    local instance = System:new(world, "galaxy", minRadius, maxRadius, 1000, mask)
    setmetatable(instance, Galaxy)

    instance.index = index

    -- description
    instance.description = Description:new()

    -- generate a collection of solar systems
    instance.solarSystems = instance:populate(config, world)
    instance.solarSystems.snapshot = nil

    -- make a drawable system to represent galaxy
    if type(config.systems) == "number" then
        instance:generateSystem(config.systems, 1, true)
    else -- assuming it's a snapshot
        instance:loadSnapshot(config.systems, world)
    end

    return instance
end

function Galaxy:populate(config, world)
    local g = {}
    local num = config.systems

    for i = 1, num do
        local system = {
            config = {
                index = i,
                numPlanets = config.planets, 
                planetMinRadius = config.planetMinRadius, 
                planetMaxRadius = config.planetMaxRadius, 
                seed = math.random(0, 10000)
            },
            snapshot = nil,
            -- visited = false
        }

        table.insert(g, system)
    end

    return g
end

function Galaxy:addBody(angle, dist, radius)
    local config = {
        world = world,
        isCore = false,
        mask = self.mask,
        type = "static"
    }

    local pos = {
        x = width / 2 + math.cos(angle) * dist,
        y = height / 2 + math.sin(angle) * dist,
        radius = radius,
    }

    local body = Body:new(config, pos)
    body.fixture:setUserData({ id=self.bodyType, index=#self.system })

    body.color = {1,1,1}

    table.insert(self.system, body)
end

return Galaxy
