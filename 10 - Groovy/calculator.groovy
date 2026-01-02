// IMPORTS
// =======

import java.io.BufferedReader
import java.io.InputStreamReader

// FUNCTIONS
// =========

void askQuestion() {
    print "Your calculation: "
    System.out.flush()
    BufferedReader reader = System.in.newReader()
    String calculation = reader.readLine()
    String result = getResult(calculation)
    println " = ${result}"
}

String getResult(String calculation) {
    calculation = sanitizeCalculation(calculation)
    double result = 0.0d

    for (String i : calculation.split("\\+")) {
        double subResult = 1.0d
        for (String j : i.split("\\*")) {
            if (j.startsWith("1/")) {
                String sanitizedJ = j.replaceFirst("1/", "")
                if (!sanitizedJ.isNumber()) return "Undefined"
                if (sanitizedJ.toDouble() == 0.0d) return "Undefined"
                subResult /= sanitizedJ.toDouble()
            } else {
                subResult *= j.toDouble()
            }
        }
        result += subResult
    }

    if (result == result.toLong() && !calculation.contains(".")) {
        return "${result.toLong()}"
    }
    return "${result.round(10)}"
}

String sanitizeCalculation(String calculation) {
    calculation
        .replaceAll('\\s+', '')                 // Remove all spaces
        .replaceAll('\\++', '+')                // ++ -> +
        .replaceAll('-+', '-')                  // -- -> -
        .replaceAll('\\*\\+', '*')              // *+ -> *
        .replaceAll('/\\+', '/')                // /+ -> /
        .replaceAll('\\+-', '-')                // +- -> -
        .replaceAll('(\\d)-(\\d)', '$1+-$2')    // a-b -> a+-b
        .replaceAll('/', '*1/')                 // a/b -> a*1/b
}

// MAIN
// ====

if (this.class.name == 'calculator') {
    askQuestion()
}