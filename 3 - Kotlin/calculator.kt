// IMPORTS
// =======

import java.io.BufferedReader
import java.io.InputStreamReader

// FUNCTIONS
// =========

fun askQuestion() {
    print("Your calculation: ")
    val reader = BufferedReader(InputStreamReader(System.`in`))
    val calculation = reader.readLine()
    val result = getResult(calculation)
    println(" = $result")
}

fun getResult(raw: String?): String {
    val calculation = sanitizeCalculation(raw ?: "")
    var result = 0.0

    for (i in calculation.split("+")) {
        var subResult = 1.0
        for (j in i.split("*")) {
            if (j.startsWith("1/")) {
                val sanitizedJ = j.removePrefix("1/")
                val value = sanitizedJ.toDoubleOrNull() ?: Double.NaN
                if (value == 0.0) return "Undefined"
                subResult /= value
            } else {
                subResult *= j.toDoubleOrNull() ?: Double.NaN
            }
        }
        result += subResult
    }

    if ((result == result.toInt().toDouble()) && !calculation.contains(".")) {
        return result.toInt().toString()
    }
    return result.toString()
}

fun sanitizeCalculation(calculation: String): String {
    return calculation
        .replace("""\s+""".toRegex(), "")               // Remove all spaces
        .replace("""\++""".toRegex(), "+")              // ++ -> +
        .replace("""-+""".toRegex(), "-")               // -- -> -
        .replace("""\*\+""".toRegex(), "*")             // *+ -> *
        .replace("""/\+""".toRegex(), "/")              // /+ -> /
        .replace("""\+-""".toRegex(), "-")              // +- -> -
        .replace("""(\d)-(\d)""".toRegex(), "$1+-$2")   // a-b -> a+-b
        .replace("/", "*1/")                            // a/b -> a*1/b
}

// MAIN
// ====

fun main() {
    askQuestion()
}