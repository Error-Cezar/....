local rname  = rconsolename
local rwarn  = rconsolewarn
local rinfo  = rconsoleinfo
local rerror = rconsoleerr
local rprint = rconsoleprint
local rclear = rconsoleclear 

function dump(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. dump(v) .. ','
       end
       return s .. '} '
    else
       return tostring(o)
    end
 end 

local Colors = {
    "Black","Blue","Green","Cyan","Red","Magent","Brown","Light Gray","Dark Gray","Light Blue","Light Green","Light Cyan","Light Red","Light Magenta","Yellow","White"
}

function ChangeColor(Clr)
local h = GetTable(Colors, Clr) 
if not h then return nil end
h = h:gsub("%s+", "_") 
h = string.upper(h)
h = "@@"..h.."@@"
return h
end

function GetTable(Tab: table, Arg: any)
    for _,v in pairs(Tab) do
        if v == Arg then return v end
    end
end

sc = {}
local Enabled
function sc:Start()
rname("Smart Console")
rwarn("SmartConsole Enabled")    
Enabled = true
end

function sc:Stop()
rwarn("SmartConsole Disabled")    
Enabled = false
end

function sc.print(text: string, color: string)
    if not Enabled then return end
    if type(text) ~= "string" then rerror("SmartConsole: <string> expected, got "..type(text).." | sc.print") return end
    local Color = ChangeColor(color)
    local t = ""
    if Color then t = Color end
    rprint(t)
    rprint(text)
    rprint(ChangeColor("White"))
end

function sc.warn(text: string)
    if not Enabled then return end
    if type(text) ~= "string" then rerror("SmartConsole: <string> expected, got "..type(text).." | sc.warn") return end
    rwarn(text)
end

function sc.info(text: string)
    if not Enabled then return end
    if type(text) ~= "string" then rerror("SmartConsole: <string> expected, got "..type(text).." | sc.info") return end
    rinfo(text)
end

function sc.error(text: string)
    if not Enabled then return end
    if type(text) ~= "string" then rerror("SmartConsole: <string> expected, got "..type(text).." | sc.error") return end
    rerror(text)
end

function sc:Clear()
   rclear()
end

function sc:Color(color: string)
    if not Enabled then return end
    if type(color) ~= "string" then rerror("SmartConsole: <string> expected, got "..type(color).." | sc:Color") return end
    local c = ChangeColor(color)
    return c or nil
end

function sc:StringTable(Tab: table)
    if not Enabled then return end
    if type(Tab) ~= "table" then rerror("SmartConsole: <table> expected, got "..type(Tab).." | sc:StringTable") return end
    return dump(Tab)
end

return sc
