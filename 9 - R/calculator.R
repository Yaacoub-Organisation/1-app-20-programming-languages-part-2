# FUNCTIONS
# =========

ask_question <- function() {
    cat("Your calculation: ")
    calculation <- readLines(con = "stdin", n = 1)
    result <- get_result(calculation)
    cat(" = ", result, "\n", sep = "")
}

get_result <- function(calculation) {
    calculation <- sanitize_calculation(calculation)
    result <- 0.0

    for (i in strsplit(calculation, "\\+", perl = TRUE)[[1]]) {
        sub_result <- 1.0
        for (j in strsplit(i, "\\*", perl = TRUE)[[1]]) {
            if (grepl("^1/", j)) {
                sanitized_j <- sub("^1/", "", j)
                value <- as.numeric(sanitized_j)
                if (as.numeric(sanitized_j) == 0) return("Undefined")
                sub_result <- sub_result / as.numeric(sanitized_j)
            } else {
                sub_result <- sub_result * as.numeric(j)
            }
        }
        result <- result + sub_result
    }

    as.character(result)
}

sanitize_calculation <- function(calculation) {
    calculation <- gsub("\\s+", "", calculation)                # Remove all spaces
    calculation <- gsub("\\++", "+", calculation)               # ++ -> +
    calculation <- gsub("-+", "-", calculation)                 # -- -> -
    calculation <- gsub("\\*\\+", "*", calculation)             # *+ -> *
    calculation <- gsub("/\\+", "/", calculation)               # /+ -> /
    calculation <- gsub("\\+-", "-", calculation)               # +- -> -
    calculation <- gsub("(\\d)-(\\d)", "\\1+-\\2", calculation) # a-b -> a+-b
    calculation <- gsub("/", "*1/", calculation)                # a/b -> a*1/b
    calculation
}

# MAIN
# ====

if (identical(sys.nframe(), 0L)) {
    ask_question()
}
