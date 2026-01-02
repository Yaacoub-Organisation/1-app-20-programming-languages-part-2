// IMPORTS
// =======

import 'dart:io';

// FUNCTIONS
// =========

void askQuestion() {
    stdout.write("Your calculation: ");
    final calculation = stdin.readLineSync();
    final result = getResult(calculation);
    stdout.writeln(" = $result");
}

String getResult(String calculation) {
    calculation = sanitizeCalculation(calculation);
    double result = 0.0;

    for (final i in calculation.split("+")) {
        double subResult = 1.0;
        for (final j in i.split("*")) {
            if (j.startsWith("1/")) {
                final sanitizedJ = j.replaceAll(RegExp(r"1/"), "");
                final value = double.tryParse(sanitizedJ) ?? double.nan;
                if (value == 0) return "Undefined";
                subResult /= value;
            } else {
                final value = double.tryParse(j) ?? double.nan;
                subResult *= value;
            }
        }
        result += subResult;
    }

    if (result == result.toInt() && !calculation.contains("/") && !calculation.contains(".")) {
        return result.toInt().toString();
    }
    return result.toString();
}

String sanitizeCalculation(String calculation) {
    return calculation
        .replaceAll(RegExp(r"\s+"), "")                                                 // Remove all spaces
        .replaceAll(RegExp(r"\++"), "+")                                                // ++ -> +
        .replaceAll(RegExp(r"-+"), "-")                                                 // -- -> -
        .replaceAll(RegExp(r"\*\+"), "*")                                               // *+ -> *
        .replaceAll(RegExp(r"/\+"), "/")                                                // /+ -> /
        .replaceAll(RegExp(r"\+-"), "-")                                                // +- -> -
        .replaceAllMapped(RegExp(r"(\d)-(\d)"), (match) => "${match[1]}+-${match[2]}")  // a-b -> a+-b
        .replaceAll("/", "*1/");                                                        // a/b -> a*1/b
}

// MAIN
// ====

void main(List<String> args) {
    askQuestion();
}