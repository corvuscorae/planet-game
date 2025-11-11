---@diagnostic disable: deprecated
local H = {}

function H.clamp(value, min, max)
    return math.min(math.max(value, min), max)
end

function H.tableHas(table, val)
    for i,v in ipairs(table) do
        if v == val then
            return true
        end
    end

    return false
end

function H.execute(func, ...)
    if type(func) == "function" then
        local args = {...}

        for i,a in ipairs(args) do
            if type(a) == "function" then
                args[i] = a()
            end
        end

        if not table.unpack then
            table.unpack = unpack
        end

        return func(table.unpack(args))
    else
        print("Error: Not a function provided.")
    end
end

function H.getGrey(color)
    local grey = (color[1] + color[2] + color[3]) / 3
    return {grey, grey, grey}    
end

return H