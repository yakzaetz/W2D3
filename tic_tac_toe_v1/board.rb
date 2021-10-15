class Board
    
    def initialize
        @grid = Array.new(3){Array.new(3, "_")}
    end

    def valid?(position)
        row = position[0]
        column = position[1]
         if (0..2).include?(row) && (0..2).include?(column)
            return true 
         else
            return false
         end 
    end

    def empty?(position)
        row = position[0]
        column = position[1]
        if @grid[row][column] == "_"
            return true
        else
            return false
        end 
    end

    def place_mark(position, mark)
        row = position[0]
        column = position[1]
        if !empty?(position) || !valid?(position)
            raise "error, either position invalid, or the position is not empty"
        end 
        @grid[row][column] = mark
    end

    def print
        @grid.each do |row|
            puts row.join(" ")
        end 
    end

    def win_row?(mark)
        @grid.each do |row|
            if row.all?{|ele| ele == mark }
                return true
            end         
        end 
        return false
    end

    def win_col?(mark)
        transposed = @grid.transpose
        transposed.each do |sub|
            if sub.all?{|ele| ele == mark }
                return true
            else
                return false
            end 
        end 
    end

    def win_diagonal?(mark)
        reversed_grid = []
        @grid.each do |row|
            reversed_grid << row.reverse
        end 
        if reversed_diagonal(reversed_grid, mark) || reversed_diagonal(@grid, mark)
            return true
        else
            return false
        end 
    end

    def reversed_diagonal(arr, mark)
        x = arr.length
        diagonal = []
        (0...x).each do |sub|
            (0...x).each do |ele|
                diagonal << arr[sub][ele] if sub == ele 
            end
        end 
        return diagonal.all?{|ele| ele == mark }
    end

    def win?(mark)
        return (win_row?(mark) || win_col?(mark) || win_diagonal?(mark))
    end

    def empty_positions?
        @grid.each do |sub|
            return true if sub.any?{|ele| ele == "_" }   
        end 
        return false
    end
    
end
