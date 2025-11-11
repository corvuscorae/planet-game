local files = love.filesystem.getDirectoryItems("assets/songs")

local i = {}

-- formats file names to be usable keys in a lua object
local function formatName(filename, ext)
    -- replace all non-alphanumerics w/ underscores (except period to preserve file type (e.g. ".wav"))
    local _,__,noExt = filename:find("(.+)%" .. ext .. "$")
    local result = noExt:gsub("[^%w]", "_")

    -- cleanup
    result = result:gsub("_+", "_") -- consecutive underscores
    result = result:gsub("^_+", "") -- leading underscores
    result = result:gsub("_+$", "") -- trailing underscores

    -- put ext back
    result = result .. ext

    return result
end

-- this will rename all files so they don't have spaces, 
--  and will also print filenames (without ext) (so we can copy/paste them to the tags object)
function i.initFiles(log)
    local ext = ".wav"

    for _, origName in ipairs(files) do
        local info = love.filesystem.getInfo("assets/songs/" .. origName)
        if info and info.type == "file" and origName ~= "_tags.lua" and origName ~= "_init.lua" then
            local format = formatName(origName, ext)

            if #format > 0 then
                -- remove spaces and rename file
                -- https://www.gammon.com.au/scripts/doc.php?lua=os.rename
                os.rename("assets/songs/" .. origName, "assets/songs/" .. format)

                local _,__,param = format:find("(.+)%" .. ext .. "$")
                if log then print(param .. " = {},") end
            else
                local _,__,param = format:find("(.+)%" .. ext .. "$")
                if log then print(param .. " = {},") end
            end

        end
    end
end

return i