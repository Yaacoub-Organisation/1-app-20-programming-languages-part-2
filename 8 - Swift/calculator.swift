// IMPORTS
// =======

import Foundation

// FUNCTIONS
// =========

func askQuestion() {
    print("Your calculation: ", terminator: "")
    guard let calculation = readLine() else { return }
    let result = getResult(calculation)
    print(" = \(result)")
}

func getResult(_ calculation: String) -> String {
    let sanitized = sanitizeCalculation(calculation)
    var result = 0.0

    for i in sanitized.split(separator: "+") {
        var subResult = 1.0
        for j in i.split(separator: "*") {
            if j.hasPrefix("1/") {
                let sanitizedJ = j.replacingOccurrences(of: "1/", with: "")
                guard let value = Double(sanitizedJ) else { continue }
                if value == 0 { return "Undefined" }
                subResult /= value
            } else {
                guard let value = Double(j) else { continue }
                subResult *= value
            }
        }
        result += subResult
    }

    if result == Double(Int(result)) && !calculation.contains("/") && !calculation.contains(".") {
        return String(Int(result))
    }
    return String(result)
}

func sanitizeCalculation(_ calculation: String) -> String {
    return calculation
        .replacing(#/\s+/#, with: "")                                     // Remove all spaces
        .replacing(#/\++/#, with: "+")                                    // ++ -> +
        .replacing(#/-+/#, with: "-")                                     // -- -> -
        .replacing(#/\*\+/#, with: "*")                                   // *+ -> *
        .replacing(#//\+/#, with: "/")                                   // /+ -> /
        .replacing(#/\+-/#, with: "-")                                    // +- -> -
        .replacing(#/(\d)-(\d)/#) { match in "\(match.1)+-\(match.2)" }   // a-b -> a+-b
        .replacing(#///#, with: "*1/")                                   // a/b -> a*1/b
}

// MAIN
// ====

let file = URL(fileURLWithPath: #file).lastPathComponent
let isCalculator = CommandLine.arguments.first.map { URL(fileURLWithPath: $0).lastPathComponent == file } ?? false
let isRunningTests = CommandLine.arguments.contains(where: { $0.hasSuffix("tests.swift") })
if isCalculator && !isRunningTests {
    askQuestion()
}