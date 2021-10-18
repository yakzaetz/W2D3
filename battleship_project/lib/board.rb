class Board
  attr_reader :size

    def initialize(n)
      @grid = Array.new(n, :N){Array.new(n, :N)}
      @size = n * n 
    end

    def [](pos)
      row, col = pos
      @grid[row][col]
    end

    def []=(pos, val)
      row, col = pos
      @grid[row][col] = val
    end

    def num_ships
      @grid.flatten.count {|ele| ele == :S }
    end 

    def attack(position)
      if self[position] == :S
        self[position] = :H
        p 'you sunk my battleship!'
        return true
      else
        self[position] = :X 
        return false
      end
    end

    def place_random_ships
      while self.num_ships < (@size / 4)
        rand_row = rand(0...@grid.length)
        rand_col = rand(0...@grid.length)
        pos = [rand_row, rand_col] 
        self[pos] = :S 
      end 
    end

    def hidden_ships_grid
      @grid.map do |sub|
        sub.map do |ele|
          if ele == :S 
            ele = :N 
          else
            ele
          end 
        end 
      end 
    end

    def self.print_grid(grid)
      grid.each do |sub|
        puts sub.join(" ")
      end 
    end 

    def cheat
      Board.print_grid(@grid)
    end

    def print
      Board.print_grid(hidden_ships_grid)
    end 

end
