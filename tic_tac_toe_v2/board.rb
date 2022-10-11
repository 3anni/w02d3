class Board
    def initialize(n=3)
        @grid = Array.new(n) {Array.new(n, "_")}
    end

    # Can probably kill these two methods
    def [] (pos)
        @grid[pos[0]][pos[1]]
    end

    def []=(pos, value)
        @grid[pos[0]][pos[1]] = value
    end

    def valid?(pos)
        pos[0] < @grid.length && pos[1] < @grid.length && pos[0] >= 0 and pos[1] >= 0
    end

    def empty?(pos)
        row, col = pos
        self[pos] == '_'
    end

    def place_mark(pos, player_symbol)
        unless valid?(pos) && empty?(pos)
            raise RuntimeError.new "invalid mark"
        end

        row, col = pos
        self[pos] = player_symbol
    end

    def win_row?(mark)
        row_won = false

        @grid.each do |row|
            row_won = row.all? {|el| el == mark} if !row_won
        end

        row_won
    end

    def win_col?(mark)
        transposed_grid = @grid.transpose

        row_won = false

        transposed_grid.each do |row|
            row_won = row.all? {|el| el == mark} if !row_won
        end

        row_won
    end

    def win_diagonal?(mark)
        left_diag = []
        right_diag = []

        # Fill left_diag and right_diag arrays with values in the diagonals
        (0...@grid.length).each do |i|
            row = i
            col = @grid.length - i - 1

            left_diag << @grid[row][col]
            right_diag << @grid[row][row]
        end


        # Check to see if either diagonal is filled with the mark
        # Simplify this!
        if (left_diag.uniq.length == 1 &&
            left_diag.uniq[0] == mark) ||
            (right_diag.uniq.length == 1 &&
                right_diag.uniq[0] == mark)

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

# b = Board.new
# b.place_mark([0, 0], :Y)
# b.place_mark([1, 1], :Y)
# b.place_mark([2, 2], :Y)

# b.print
# p b.win_row?(:X)
# p b.win_row?(:Y)
# p b.win_col?(:X)
# p b.win_col?(:Y)
# p b.win_diagonal?(:X)
# p b.win_diagonal?(:Y)

# p b.win?(:X)
# p b.win?(:Y)
