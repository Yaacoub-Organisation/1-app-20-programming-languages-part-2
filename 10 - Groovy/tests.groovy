// IMPORTS
// =======

import groovy.transform.Field

// VARIABLES
// =========

@Field
def calc = new GroovyShell(this.class.classLoader).parse(new File("calculator.groovy"))

// FUNCTIONS
// =========

void runTests() {
    println "Test 01: ${calc.getResult("2 + 3") == "${2 + 3}"}"
    println "Test 02: ${calc.getResult("2 - 3") == "${2 - 3}"}"
    println "Test 03: ${calc.getResult("2 * 3") == "${2 * 3}"}"
    println "Test 04: ${calc.getResult("2 / 3") == "${2 / 3}"}"
    println "Test 05: ${calc.getResult("2 / 0") == "Undefined"}"
    println "Test 06: ${calc.getResult("  7 +   2 * 3 - 4 / -2 ") == "${  7 +   2 * 3 - 4 / -2 }"}"
    println "Test 07: ${calc.getResult("  7 +   2 / 3 - 4 * +-2 ") == "${  7 +   2 / 3 - 4 * +-2 }"}"
    println "Test 08: ${calc.getResult("2.0 + 3.0") == "${2.0 + 3.0}"}"
}

// MAIN
// ====

if (this.class.name == 'tests') {
    runTests()
}