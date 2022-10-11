class Board
    def initialize(n=3)
        @grid = Array.new(n) {Array.new(n, "_")}
    end

    # Can probably kill these two methods
    def [] (arr)
        @grid[arr[0]][arr[1]]
    end

    def []=(pos, value)
        @grid[pos[0]][pos[1]] = value
    end

    def valid?(pos)
        pos[0] < @grid.length && pos[1] < @grid.length && pos[0] >= 0 and pos[1] >= 0
    end

    def empty?(pos)
        row, col = pos
        @grid[row][col] == '_'
    end

    def place_mark(pos, player_symbol)
        unless valid?(pos) && empty?(pos)
            raise RuntimeError.new "invalid mark"
        end

        row, col = pos
        @grid[row][col] = player_symbol
    end

    def win_row?(mark)
        # Check Rows
        @grid.each do |row|
            if row.uniq == [mark]
                print mark
                puts " wins"
                return true
            end
        end

        false
    end

    def win_col?(mark)
        transposed_board = @grid.transpose
        transposed_board.each do |col|
            if col.uniq == [mark]
                print mark
                puts " wins"
                return true
            end
        end

        false
    end

    def win_diagonal?(mark)
        left_diag = []
        right_diag = []

        (0...@grid.length).each do |i|
            row = i
            col = @grid.length - i - 1

            left_diag << @grid[row][col]
            right_diag << @grid[row][row]
        end

        puts right_diag.uniq
        puts mark

        if left_diag.uniq == [mark] || right_diag.uniq == [mark]
            print mark
            puts " wins"
            return true
        end

        false
    end

    def win?(mark)
       win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def self.print_grid(grid)
        (0...grid.length).each do |row|
            puts grid[row].join" "
        end
    end

    def print
        Board.print_grid(@grid)
    end

    def empty_positions?
        (0...@grid.length).each do |i|
            (0...@grid.length).each do |j|
                if @grid[i][j] == '_'
                    return true
                end
            end
        end

        false
    end
end
