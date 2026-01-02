-- FUNCTIONS
-- =========

local function sanitizeCalculation(calculation)
    calculation = calculation:gsub("%s+", "")               -- Remove all spaces
    calculation = calculation:gsub("%++", "+")              -- ++ -> +
    calculation = calculation:gsub("%-+", "-")              -- -- -> -
    calculation = calculation:gsub("%*%+", "*")             -- *+ -> *
    calculation = calculation:gsub("/%+", "/")              -- /+ -> /
    calculation = calculation:gsub("%+%-", "-")             -- +- -> -
    calculation = calculation:gsub("(%d)-(%d)", "%1+-%2")   -- a-b -> a+-b
    calculation = calculation:gsub("/", "*1/")              -- a/b -> a*1/b
    return calculation
end

local function getResult(calculation)
    calculation = sanitizeCalculation(calculation or "")
    local result = 0.0

    for i in calculation:gmatch("([^%+]+)") do
        local subResult = 1.0
        for j in i:gmatch("([^%*]+)") do
            if j:sub(1, 2) == "1/" then
                local sanitizedJ = j:sub(3)
                if tonumber(sanitizedJ) == 0 then return "Undefined" end
                subResult = subResult / tonumber(sanitizedJ)
            else
                subResult = subResult * tonumber(j)
            end
        end
        result = result + subResult
    end

    if result == math.tointeger(result) and not calculation:find("/") and not calculation:find("%.") then
        return tostring(math.tointeger(result))
    end
    return tostring(result)
end

local function askQuestion()
    io.write("Your calculation: ")
    local calculation = io.read("*l") or ""
    local result = getResult(calculation)
    print(" = " .. result)
end

-- MAIN
-- ====

-- If required as a module, expose functions; otherwise run CLI
if pcall(debug.getlocal, 4, 1) then
    return { getResult = getResult }
else
    askQuestion()
end