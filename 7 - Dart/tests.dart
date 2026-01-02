// IMPORTS
// =======

import 'calculator.dart';

// FUNCTIONS
// =========

void runTests() {
    print('Test 01: ${getResult("2 + 3") == "${2 + 3}"}');
    print('Test 02: ${getResult("2 - 3") == "${2 - 3}"}');
    print('Test 03: ${getResult("2 * 3") == "${2 * 3}"}');
    print('Test 04: ${getResult("2 / 3") == "${2 / 3}"}');
    print('Test 05: ${getResult("2 / 0") == "Undefined"}');
    print('Test 06: ${getResult("  7 +   2 * 3 - 4 / -2 ") == "${  7 +   2 * 3 - 4 / -2 }"}');
    print('Test 07: ${getResult("  7 +   2 / 3 - 4 * +-2 ") == "${  7 +   2 / 3 - 4 * -2 }"}');
    print('Test 08: ${getResult("2.0 + 3.0") == "${2.0 + 3.0}"}');
}

// MAIN
// ====

void main(List<String> args) {
    runTests();
}