class Player
    attr_reader :mark
   def initialize(mark_value)
    @mark = mark_value
   end 

   def get_position
    puts "enter the position as two numbers with a space between them"
       input = gets.chomp.split
        if input.length != 2
            raise "error"
        end 
    input.map {|ele| ele.to_i }
   end
end

