local H = require("utils.helpers")
local Settings = require("utils.settings")
local width, height = Settings.width, Settings.height

local Ship = require("classes.ship")

local gal = {}
local Galaxy = require("classes.galaxy")

function gal:load(args)
    if args and args.index and args.snapshot then 
        galaxy.system[args.index].snapshot = args.snapshot 
    end

    if not world then world = love.physics.newWorld(0, 0, true) end
    if not ship then ship = Ship:new(world, width/4, height/4) end

    if not galaxy then
        local sysConf = {
            numSystems = 5,
            numPlanets = 7,  -- shouldnt exceed the number of audio loops available
            planetMinRadius = 5,
            planetMaxRadius = 25
        }

        galaxy = Galaxy:new("TEMP_INDEX", sysConf, world)
    end

    if not sys_select then sys_select = 1 end
end

function gal:draw()
    love.graphics.print("press enter to go to solar system #" .. sys_select, 200, 300)
end

function gal:update(dt)
end

function gal:keypressed(key)
    if(tonumber(key)) then
        sys_select = H.clamp(tonumber(key), 1, #galaxy.system)
    end

    if key == "return" then
        gal.setScene(
            "solsys",  
            {   
                ship = ship, 
                planets = galaxy.system[sys_select], 
                index = sys_select,
                world = world
            }
        )
    end
end

return gal