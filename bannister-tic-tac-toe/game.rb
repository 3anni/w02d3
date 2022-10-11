require_relative "./board.rb"
require_relative "./human_player.rb"

class Game

    def initialize(player_1_mark, player_2_mark)
        @player_1 = HumanPlayer.new(player_1_mark)
        @player_2 = HumanPlayer.new(player_2_mark)
        @board = Board.new(3)
        @current_player = @player_1
    end

    def switch_turn
        if @current_player == @player_1
            @current_player = @player_2
        else
            @current_player = @player_1
        end
    end

    def play
        while !@board.win?(@player_1.mark) && !@board.win?(@player_2.mark) && @board.empty_positions?
            @board.print

            # Get a position from the current player
            pos = @current_player.get_position

            # Place their mark at that position of the board
            @board.place_mark(pos, @current_player.mark)

            # Check if that user has won. If so, print out a 'victory' message saying who won and return to end the game
            if @board.win?(@current_player.mark)
                print "victory to"
                puts @current_player.mark
                return
            else
                switch_turn
            end
        end

        puts "game was drawn"
    end





end
