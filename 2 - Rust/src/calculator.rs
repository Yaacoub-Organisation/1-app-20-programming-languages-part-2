// IMPORTS
// =======

use regex::Regex;
use std::io::{self, Write};

// FUNCTIONS
// =========

#[allow(dead_code)]
fn ask_question() {
    print!("Your calculation: ");
    io::stdout().flush().ok();
    let mut input = String::new();
    if io::stdin().read_line(&mut input).is_ok() {
        let result = get_result(&input);
        println!(" = {}", result);
    }
}

pub fn get_result(calculation: &str) -> String {
    let calculation = sanitize_calculation(calculation);
    let mut result = 0.0f64;

    for i in calculation.split('+') {
        let mut sub_result = 1.0f64;
        for j in i.split('*') {
            if let Some(sanitized_j) = j.strip_prefix("1/") {
                if sanitized_j.parse().unwrap_or(f64::NAN) == 0.0 { return "Undefined".to_string(); }
                sub_result /= sanitized_j.parse().unwrap_or(f64::NAN);
            } else {
                sub_result *= j.parse().unwrap_or(f64::NAN);
            }
        }
        result += sub_result;
    }

    format!("{}", result)
}

fn sanitize_calculation(calculation: &str) -> String {
    let mut calc = Regex::new(r"\s+").unwrap().replace_all(calculation, "").into_owned();   // Remove all spaces
    calc = Regex::new(r"\++").unwrap().replace_all(&calc, "+").into_owned();                // ++ -> +
    calc = Regex::new(r"-+").unwrap().replace_all(&calc, "-").into_owned();                 // -- -> -
    calc = Regex::new(r"\*\+").unwrap().replace_all(&calc, "*").into_owned();               // *+ -> *
    calc = Regex::new(r"/\+").unwrap().replace_all(&calc, "/").into_owned();                // /+ -> /
    calc = Regex::new(r"\+-").unwrap().replace_all(&calc, "-").into_owned();                // +- -> -
    calc = Regex::new(r"(\d)-(\d)").unwrap().replace_all(&calc, "$1+-$2").into_owned();     // a-b -> a+-b
    calc = Regex::new(r"\/").unwrap().replace_all(&calc, "*1/").into_owned();               // a/b -> a*1/b
    calc
}

// MAIN
// ====

#[allow(dead_code)]
fn main() {
    ask_question();
}
