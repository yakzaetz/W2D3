class Code

  attr_reader :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(arr)
    arr.each do |ele|
      if !POSSIBLE_PEGS.has_key?(ele.upcase)
        return false 
      end
    end 
      return true 
  end

  def initialize(arr)
    @pegs = []
    if !Code.valid_pegs?(arr)
      raise "error, invalid pegs"
    else
      arr.each do |ele|
        @pegs << ele.upcase
      end 
    end 
    @pegs
  end

  def self.random(length)
    keys = POSSIBLE_PEGS.keys
    rand = rand(0...keys.length)

    arr = Array.new(length, keys[rand])
    Code.new(arr)
  end

  def self.from_string(pegs)
    Code.new(pegs.split(""))
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    count = 0
    @pegs.each.with_index do |ele, i|
      count += 1 if guess.pegs[i] == @pegs[i]
    end
    count  
  end

  def num_near_matches(guess)
   
    count = 0
    guess_dup = guess.pegs.dup
    pegs_dup = pegs.dup

    pegs.dup.each.with_index do |ele, i|
      if pegs_dup[i] == guess_dup[i]
        pegs_dup[i] = ""
        guess_dup[i] = ""
      end 
    end 

    guess_dup.each do |ele|
      if ele != "" && pegs_dup.include?(ele)
        pegs_dup[pegs_dup.index(ele)] = ""
        count += 1
      end 
    end 
    count
  end 

  def ==(guess)
    self.pegs == guess.pegs
  end
  
end
