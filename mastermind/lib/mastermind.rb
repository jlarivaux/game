require_relative "code"

class Mastermind

    def initialize(length)
        @secret_code = Code.random(length)
    end


    def print_matches(guess)
        print @secret_code.num_exact_matches(guess)
        print @secret_code.num_near_matches(guess)
    end


    def ask_user_for_guess
        print "Enter a code"
        guess_code = gets.chomp
        guess = Code.from_string(guess_code)
        print_matches(guess)
        @secret_code == guess
    end

end
