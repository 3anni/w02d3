# require_relative "./board.rb"

class ComputerPlayer
    attr :mark

    def initialize(mark)
        @mark = mark
    end

    # This method should prompt and allow the user to enter a valid row col position.
    # We recommend that you ask the user to enter the position as two numbers with a space between them.
    # Your method should return their entered position as an array of the form [row, col] so that
    # it is compatible with the design of our previous Board methods.
    def get_position(legal_positions)
        # Get a random position from the array
        computer_move = legal_positions[rand(0...legal_positions.length)]

        puts "Computer move: #{computer_move}"

        # Return position array [row, col] with computer's move
        computer_move
    end
end
