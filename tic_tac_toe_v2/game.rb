require_relative "./board.rb"
require_relative "./human_player.rb"

class Game

    def initialize(board_size, *player_marks)
        @board = Board.new(board_size)

        @players = []
        player_marks.each do |player_mark|
            @players.push(HumanPlayer.new(player_mark))
        end

        @current_player = @players[0] # should this instead be just the number 0
    end

    def switch_turn
        @players.rotate!
        @current_player = @players[0]
    end

    def play
        while @board.empty_positions? && @players.none? { |player| @board.win?(player.mark)}
            @board.print

            # Get a position from the current player
            pos = @current_player.get_position

            # Place their mark at that position of the board
            @board.place_mark(pos, @current_player.mark)

            # Check if that user has won. If so, print out a 'victory' message saying who won and return to end the game
            if @board.win?(@current_player.mark)
                puts "Victory to #{@current_player.mark}!"
                return
            else
                switch_turn
            end
        end

        puts "game was drawn"
    end
end
