class Board
    attr_reader :size

    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n * n
    end

    def [] (arr)
        @grid[arr[0]][arr[1]]
    end

    def []=(pos, value)
        @grid[pos[0]][pos[1]] = value
    end

    def num_ships
        @grid.flatten.count(:S)
    end

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            puts "you sunk my battleship"
            return true
        else
            self[pos] = :X
            return false
        end

    end

    def place_random_ships
        ship_locations = []
        dim = Math.sqrt(@size).to_i
        starting_ship_count = @size * 0.25

        while ship_locations.length < starting_ship_count
            next_location = [rand(0...dim), rand(0...dim)]
            if !ship_locations.include?(next_location)
                ship_locations << next_location
                self[next_location] = :S
            end
        end
        starting_ship_count
    end

    def hidden_ships_grid
        n = Math.sqrt(@size).to_i
        h_grid = Array.new(n) {Array.new(n)}

        (0...n).each do |i|
            (0...n).each do |j|
                item = self[[i, j]]
                if item == :S
                    h_grid[i][j] = :N
                else
                    h_grid[i][j] = item
                end
            end
        end

        h_grid
    end

    def self.print_grid(grid)
        (0...grid.length).each do |row|
            (0...grid[0].length).each do |column|
                print grid[row][column]
                if column != grid[0].length - 1
                    print " "
                end
            end
            print "\n"
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end
end
