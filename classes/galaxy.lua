local Galaxy = {}
Galaxy.__index = Galaxy

function Galaxy:new(index, solsysConfig, world)
    local instance = {
        index = index,
        system = {}
    }
    setmetatable(instance, Galaxy)

    instance.system = instance:populate(solsysConfig, world)
    instance.system.snapshot = nil

    return instance
end

function Galaxy:populate(config, world)
    local g = {}
    local num = config.numSystems

    for i = 1, num do
        local system = {
            config = {
                index = i,
                numPlanets = config.numPlanets, 
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

return Galaxy
