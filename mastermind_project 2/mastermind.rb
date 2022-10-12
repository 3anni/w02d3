require_relative "./code.rb"

class Mastermind
    def initialize
        @secret_code = Code.random(4)
    end

    def print_matches(code)
        puts "Exact matches: #{@secret_code.num_exact_matches(code)}"
        puts "Near matches: #{@secret_code.num_near_matches(code)}"
    end

    def ask_user_for_guess
        puts "Enter a guess sequence: "
        guess = gets.chomp
        until Code.valid_pegs?(guess)
            puts "Enter a guess sequence: "
            guess = gets.chomp
            puts "#{guess} contains invalid colors" if !Code.valid_pegs?(guess)
            raise "#{guess} is the incorrect length" if guess.length != @secret_code.length
        end
        guess
    end

    def play
        guess = Code.from_string(ask_user_for_guess)

        while guess != @secret_code ## consider changing to until
            print_matches(guess)
            guess = Code.from_string(ask_user_for_guess)
        end

        puts "You win!"
    end
end
