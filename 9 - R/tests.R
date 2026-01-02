# IMPORTS
# =======

source("calculator.R")

# FUNCTIONS
# =========

run_tests <- function() {
  cat("Test 01: ", get_result("2 + 3") == as.character(2 + 3), "\n", sep = "")
  cat("Test 02: ", get_result("2 - 3") == as.character(2 - 3), "\n", sep = "")
  cat("Test 03: ", get_result("2 * 3") == as.character(2 * 3), "\n", sep = "")
  cat("Test 04: ", get_result("2 / 3") == as.character(2 / 3), "\n", sep = "")
  cat("Test 05: ", get_result("2 / 0") == "Undefined", "\n", sep = "")
  cat("Test 06: ", get_result("  7 +   2 * 3 - 4 / -2 ") == as.character(  7 +   2 * 3 - 4 / -2 ), "\n", sep = "")
  cat("Test 07: ", get_result("  7 +   2 / 3 - 4 * +-2 ") == as.character(  7 +   2 / 3 - 4 * +-2 ), "\n", sep = "")
  cat("Test 08: ", get_result("2.0 + 3.0") == as.character(2.0 + 3.0), "\n", sep = "")
}

# MAIN
# ====

if (identical(sys.nframe(), 0L)) {
  run_tests()
}
