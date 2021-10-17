class Board
  attr_reader :size

  def initialize(n)
    @grid = Array.new(n, :N){Array.new(n, :N)}
    @size = n * n
  end

  def [](position)
    row= position[0]
    col = position[1]
    @grid[row][col]
  end

  def []=(position, val)
    row= position[0]
    col = position[1]
    @grid[row][col] = val
  end

  def num_ships
    count = 0
    @grid.each do |sub|
      sub.each do |ele|
        count += 1 if ele == :S
      end 
    end 
    count 
  end 

  def attack(position)
    if self[position] == :S
      self[position] = :H 
      p "you sunk my battleship"
      return true
    else
      self[position] = :X 
      return false
    end
  end

  def place_random_ships
    while self.num_ships < @size / 4.0
      rand_row = rand(0...@grid.length)
      rand_col = rand(0...@grid.length)
      pos = [rand_row, rand_col]
      @grid[rand_row][rand_col] = :S
    end 
  end

  def hidden_ships_grid
    @grid.map do |sub|
      sub.map do |ele| 
        if ele == :S 
          :N
        else
          ele
        end 
      end 
    end 
  end

  

end