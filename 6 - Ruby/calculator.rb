# FUNCTIONS
# =========

def ask_question
    print 'Your calculation: '
    calculation = STDIN.gets
    return unless calculation
    result = get_result(calculation)
    puts " = #{result}"
end

def get_result(calculation)
    calculation = sanitize_calculation(calculation)
    result = 0.0

    calculation.split('+').each do |i|
        sub_result = 1.0
        i.split('*').each do |j|
            if j.start_with?('1/')
                sanitized_j = j.gsub(%r{1/}, '')
                return 'Undefined' if sanitized_j.to_f == 0.0
                sub_result /= sanitized_j.to_f
            else
                sub_result *= j.to_f
            end
        end
        result += sub_result
    end

    if result == result.to_i and !calculation.include?("/") and !calculation.include?(".") then
        return result.to_i.to_s
    end
    result.to_s
end

def sanitize_calculation(calculation)
    calculation
        .gsub(/\s+/, '')                # Remove all spaces
        .gsub(/\++/, '+')               # ++ -> +
        .gsub(/-+/, '-')                # -- -> -
        .gsub(/\*\+/, '*')              # *+ -> *
        .gsub(/\/\+/, '/')              # /+ -> /
        .gsub(/\+-/, '-')               # +- -> -
        .gsub(/(\d)-(\d)/, '\1+-\2')    # a-b -> a+-b
        .gsub(/\//, '*1/')              # a/b -> a*1/b
end

# MAIN
# ====

if __FILE__ == $PROGRAM_NAME
    ask_question
end