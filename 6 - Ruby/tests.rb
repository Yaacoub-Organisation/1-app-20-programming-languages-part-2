# IMPORTS
# =======

require_relative './calculator'

# FUNCTIONS
# =========

def run_tests
  puts "Test 01: #{get_result('2 + 3') == (2 + 3).to_s}"
  puts "Test 02: #{get_result('2 - 3') == (2 - 3).to_s}"
  puts "Test 03: #{get_result('2 * 3') == (2 * 3).to_s}"
  puts "Test 04: #{get_result('2 / 3') == (2 / 3.0).to_s}"
  puts "Test 05: #{get_result('2 / 0') == 'Undefined'}"
  puts "Test 06: #{get_result('  7 +   2 * 3 - 4 / -2 ') == (  7 +   2 * 3 - 4 / -2.0 ).to_s}"
  puts "Test 07: #{get_result('  7 +   2 / 3 - 4 * +-2 ') == (  7 +   2 / 3.0 - 4 * +-2 ).to_s}"
  puts "Test 08: #{get_result('2.0 + 3.0') == (2.0 + 3.0).to_s}"
end

# MAIN
# ====

if __FILE__ == $PROGRAM_NAME
  run_tests
end