class Board
  
    attr_accessor :size, :grid

    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n * n
    end


    def[](position)
        @grid[position[0]][position[1]]
    end

    
    def []=(position, number)
        @grid[position[0]][position[1]] = number
    end


    def num_ships
        #count = 0
        @grid.flatten.count(:S)
        # @grid.each { |subarray| subarray.each { |i| count += 1 if i == :S } }
        # count
    end


    def attack(position)
      if self[position] == :S
        self[position] = :H
        puts "you sunk my battleship!"
        return true
      else
        self[position] = :X
        return false
      end
    end


    def place_random_ships
        ships = @size * 0.25

        while self.num_ships < ships
            rand_row = rand(0...@grid.length)
            rand_col = rand(0...@grid.length)
            pos = [rand_row,rand_col]
            self[pos] = :S
        end
    end


    def hidden_ships_grid
        size = @grid.length
        new_array = Array.new(size) {Array.new(size) }
        @grid.each_with_index do |i, col|
            i.each_with_index do |ele, row|
                if ele == :S
                    new_array[col][row] = :N
                else
                    new_array[col][row] = ele
                end
            end
        end
        new_array
    end


    def self.print_grid(grid)
        grid.each do |row|
            puts row.join(" ")
        end
    end


    def cheat
        Board.print_grid(@grid)
    end


    def print
        Board.print_grid(hidden_ships_grid)
    end

    
end

