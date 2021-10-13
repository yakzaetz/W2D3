class Board
    attr_reader :size

    def self.print_grid(grid)
        grid.each do |sub|
            puts sub.join(" ")
        end 
    end 

    def cheat
        Board.print_grid(@grid)
    end

  def initialize(number)
      @grid = Array.new(number, :N) {Array.new(number, :N)}
      @size = (number * number)
  end

  def [](position)
      row = position[0]
      column = position[1]
      @grid[row][column]
  end

  def []=(position, val)
    row = position[0]
    column = position[1]
    @grid[row][column] = val
  end

  def num_ships
      @grid.flatten.count {|ele| ele == :S }
  end

  def attack(position)
      if self[position] == :S
        self[position] = :H
        puts 'you sunk my battleship!'
        return true
      else
        self[position] = :X
        return false
      end 
  end

  def place_random_ships
      amount_of_ships = size / 4
      while num_ships < amount_of_ships
        r = rand(0...@grid[0].length)
        c = rand(0...@grid[0].length)
        # position = []
        self[[r, c]] = :S
      end 
  end

  def hidden_ships_grid
      @grid.map do |row|
        row.map do |ele|
            if ele == :S 
                :N 
            else
                ele 
            end
      end  
    end 
  end

  def print
      Board.print_grid(hidden_ships_grid)
  end

  



  
end
