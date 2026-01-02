package main

// IMPORTS
// =======

import (
    "math/big"
    "regexp"
    "strconv"
    "strings"
)

// FUNCTIONS
// =========

func GetResult(calculation string) string {
    calculation = sanitizeCalculation(calculation)
    result := new(big.Rat)
    result.SetInt64(0)

    for _, i := range strings.Split(calculation, "+") {
        subResult := big.NewRat(1, 1)
        for _, j := range strings.Split(i, "*") {
            if strings.HasPrefix(j, "1/") {
                sanitizedJ := strings.TrimPrefix(j, "1/")
				denom := new(big.Rat)
				denom.SetString(sanitizedJ)
                if denom.Sign() == 0 { return "Undefined" }
                subResult.Quo(subResult, denom)
            } else {
				factor := new(big.Rat)
				factor.SetString(j)
                subResult.Mul(subResult, factor)
            }
        }
        result.Add(result, subResult)
    }

    f, _ := result.Float64()
    return strconv.FormatFloat(f, 'f', -1, 64)
}

func sanitizeCalculation(calculation string) string {
    calc := regexp.MustCompile(`\s+`).ReplaceAllString(calculation, "")			// Remove all spaces
    calc = regexp.MustCompile(`\++`).ReplaceAllString(calc, "+")				// ++ -> +
    calc = regexp.MustCompile(`-+`).ReplaceAllString(calc, "-")					// -- -> -
    calc = regexp.MustCompile(`\*\+`).ReplaceAllString(calc, "*")				// *+ -> *
    calc = regexp.MustCompile(`/\+`).ReplaceAllString(calc, "/")				// /+ -> /
    calc = regexp.MustCompile(`\+-`).ReplaceAllString(calc, "-")				// +- -> -
    calc = regexp.MustCompile(`(\d)-(\d)`).ReplaceAllString(calc, "$1+-$2")		// a-b -> a+-b
    calc = strings.ReplaceAll(calc, "/", "*1/")									// a/b -> a*1/b
    return calc
}