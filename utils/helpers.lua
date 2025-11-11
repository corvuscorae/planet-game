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

return H