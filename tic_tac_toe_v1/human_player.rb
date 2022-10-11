class HumanPlayer
    attr :mark

    def initialize(mark)
        @mark = mark
    end

    # This method should prompt and allow the user to enter a valid row col position.
    # We recommend that you ask the user to enter the position as two numbers with a space between them.
    # Your method should return their entered position as an array of the form [row, col] so that
    # it is compatible with the design of our previous Board methods.
    def get_position
        # Get position from user
        puts @mark.to_s + "'s turn."
        puts "Please enter a position as 'row + space + col', for instance '2 1' for position [2, 1]"
        position_string = gets.chomp

        # Check if input is in proper form
        unless position_string.match('^(\d) (\d)$')
            raise RuntimeError.new "sorry, that was invalid :("
        end

        # Get/return position array [row, col] with user inputs
        position_string.split(" ").map { |num| num.to_i }
    end
end
