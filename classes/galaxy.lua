local Galaxy = {}
Galaxy.__index = Galaxy

function Galaxy:new(index, solsysConfig, world)
    local instance = {
        index = index,
        system = {}
    }
    setmetatable(instance, Galaxy)

    instance.system = instance:populate(solsysConfig, world)

    return instance
end

function Galaxy:populate(config, world)
    local g = {}
    local num = config.numSystems

    for i = 1, num do
        local system = {
            numPlanets = config.numPlanets, 
            planetMinRadius = config.planetMinRadius, 
            planetMaxRadius = config.planetMaxRadius, 
        }

        table.insert(g, system)
    end

    return g
end

return Galaxy
