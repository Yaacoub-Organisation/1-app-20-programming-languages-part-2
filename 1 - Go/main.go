//go:build !testmain
// +build !testmain

package main

// IMPORTS§
// =======

import (
    "bufio"
    "fmt"
    "os"
    "strings"
)

// FUNCTIONS
// =========

func askQuestion() {
    reader := bufio.NewReader(os.Stdin)
    fmt.Print("Your calculation: ")
    input, _ := reader.ReadString('\n')
    input = strings.TrimSpace(input)
    result := GetResult(input)
    fmt.Printf(" = %s\n", result)
}

// MAIN
// ====

func main() {
    askQuestion()
}
