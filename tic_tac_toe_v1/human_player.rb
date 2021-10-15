class Player
    attr_reader :mark
    def initialize(value)
        @mark = value
    end

    def get_position
        puts "player #{@mark}, enter the position as two numbers with a space between them"
        input = gets.chomp.split(" ")
        if input.length != 2
            raise "error, enter a valid entry" 
        end 
        return input.map{ |ele| ele.to_i }   
    end
end

