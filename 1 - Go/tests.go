//go:build testmain
// +build testmain

package main

// IMPORTS
// =======

import (
    "fmt"
    "strconv"
)

// FUNCTIONS
// =========

func runTests() {
    fmt.Printf("Test 01: %v\n", GetResult("2 + 3") == fmt.Sprint(2 + 3))
    fmt.Printf("Test 02: %v\n", GetResult("2 - 3") == fmt.Sprint(2 - 3))
    fmt.Printf("Test 03: %v\n", GetResult("2 * 3") == fmt.Sprint(2 * 3))
    fmt.Printf("Test 04: %v\n", GetResult("2 / 3") == fmt.Sprint(2.0 / 3.0))
    fmt.Printf("Test 05: %v\n", GetResult("2 / 0") == "Undefined")
    fmt.Printf("Test 06: %v\n", GetResult("  7 +   2 * 3 - 4 / -2 ") == fmt.Sprint(  7 +   2 * 3 - 4 / -2 ))
    fmt.Printf("Test 07: %v\n", GetResult("  7 +   2 / 3 - 4 * +-2 ") == strconv.FormatFloat(  7 +   2.0 / 3 - 4 * +-2 , 'f', -1, 64))
    fmt.Printf("Test 08: %v\n", GetResult("2.0 + 3.0") == fmt.Sprint(2.0 + 3.0))
}

// MAIN
// ====

func main() {
	runTests()
}