local M = {}

function M.darken(hex, percent)
    local num = tonumber(hex:gsub("#", ""), 16)
    local r = math.floor((num / 65536) * (100 - percent) / 100)
    local g = math.floor(((num % 65536) / 256) * (100 - percent) / 100)
    local b = math.floor((num % 256) * (100 - percent) / 100)
    return string.format("#%02X%02X%02X", r, g, b)
end

function M.lighten(hex, percent)
    local num = tonumber(hex:gsub("#", ""), 16)
    local r = math.floor((num / 65536) + (255 - (num / 65536)) * percent / 100)
    local g = math.floor(((num % 65536) / 256 + (255 - ((num % 65536) / 256)) * percent / 100))
    local b = math.floor((num % 256 + (255 - (num % 256)) * percent / 100))
    return string.format("#%02X%02X%02X", r, g, b)
end

return M
