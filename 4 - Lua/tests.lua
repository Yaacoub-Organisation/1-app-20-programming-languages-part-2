-- IMPORTS
-- =======

local calc = require("calculator")
local getResult = calc.getResult

-- FUNCTIONS
-- =========

local function runTests()
    print("Test 01: " .. tostring(getResult("2 + 3") == tostring(2 + 3)))
    print("Test 02: " .. tostring(getResult("2 - 3") == tostring(2 - 3)))
    print("Test 03: " .. tostring(getResult("2 * 3") == tostring(2 * 3)))
    print("Test 04: " .. tostring(getResult("2 / 3") == tostring(2 / 3)))
    print("Test 05: " .. tostring(getResult("2 / 0") == "Undefined"))
    print("Test 06: " .. tostring(getResult("  7 +   2 * 3 - 4 / -2 ") == tostring(  7 +   2 * 3 - 4 / -2 )))
    print("Test 07: " .. tostring(getResult("  7 +   2 / 3 - 4 * +-2 ") == tostring(  7 +   2 / 3 - 4 * -2 )))
    print("Test 08: " .. tostring(getResult("2.0 + 3.0") == tostring(2.0 + 3.0)))
end

-- MAIN
-- ====

runTests()