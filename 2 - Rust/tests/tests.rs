// IMPORTS
// =======

#[path = "../src/calculator.rs"]
mod calculator;

use calculator::get_result;

// FUNCTIONS
// =========

#[test]
fn run_tests() {
    assert_eq!(get_result("2 + 3"), format!("{}", 2 + 3));
    assert_eq!(get_result("2 - 3"), format!("{}", 2 - 3));
    assert_eq!(get_result("2 * 3"), format!("{}", 2 * 3));
    assert_eq!(get_result("2 / 3"), format!("{}", 2.0 / 3.0));
    assert_eq!(get_result("2 / 0"), "Undefined");
    assert_eq!(get_result("  7 +   2 * 3 - 4 / -2 "), format!("{}",   7.0 +   2.0 * 3.0 - 4.0 / -2.0 ));
    assert_eq!(get_result("  7 +   2 / 3 - 4 * +-2 "), format!("{}",   7.0 +   2.0 / 3.0 - 4.0 * -2.0 ));
    assert_eq!(get_result("2.0 + 3.0"), format!("{}", 2.0 + 3.0));
}

// MAIN
// ====

fn main() {
    run_tests();
}