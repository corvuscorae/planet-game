local H = require("utils.helpers")
local Settings = require("utils.settings")
local width, height = Settings.width, Settings.height

local Ship = require("classes.ship")

local gal = {}
local Galaxy = require("classes.galaxy")

function gal:load(args)
    if args and args.index and args.snapshot then 
        galaxy.solarSystems[args.index].snapshot = args.snapshot 
    end

    if not world then world = love.physics.newWorld(0, 0, true) end
    if not ship then ship = Ship:new(world, width/4, height/4) end

    if not galaxy then
        local sysConf = {
            systems = 5,
            planets = 7,  -- shouldnt exceed the number of audio loops available
            planetMinRadius = 5,
            planetMaxRadius = 25
        }

        galaxy = Galaxy:new(world, sysConf, "TEMP_INDEX")
    end

    if not sys_select then sys_select = 1 end
end

function gal:draw()
    love.graphics.print("press enter to go to solar system #" .. sys_select, 200, 300)

    -- Draw stars/solar systems
    for _, planet in ipairs(galaxy.system) do        
        local color = planet.alive and planet.color or galaxy:getGrey(planet.color)
        
        love.graphics.setColor(color)
        love.graphics.circle("fill", planet.body:getX(), planet.body:getY(), planet.shape:getRadius())

        if planet.activationTime then
            galaxy:activateBody(planet)
        end
    end
end

function gal:update(dt)
end

function gal:keypressed(key)
    if(tonumber(key)) then
        sys_select = H.clamp(tonumber(key), 1, #galaxy.solarSystems)
    end

    if key == "return" then
        gal.setScene(
            "solsys",  
            {   
                ship = ship, 
                planets = galaxy.solarSystems[sys_select], 
                index = sys_select,
                world = world
            }
        )
    end
end

return gal