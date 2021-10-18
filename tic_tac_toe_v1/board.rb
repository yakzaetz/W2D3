class Board
    
    def initialize
        @board = Array.new(3, "_"){Array.new(3, "_")}
    end

    def valid?(position)
        row, col = position
        if 
            row > 2 || row < 0
            return false
        elsif
            col > 2 || col < 0
            return false
        end 
        return true
    end

    def empty?(position)
        row, col = position
        if @board[row][col] == "_"
            return true
        else
            return false
        end 
    end

    def place_mark(position, mark)
        row, col = position
        if !empty?(position) || !valid?(position)
            raise "invalid entry"
        end 
        @board[row][col] = mark
    end

    def print
        @board.each do |sub|
            puts sub.join(" ")
        end 
    end

    def win_row?(mark)
        @board.each do |sub|
            return true if sub.all? {|ele| ele == mark }
        end 
        return false
    end

    def win_col?(mark)
        trans = @board.transpose
        trans.each do |sub|
            return true if sub.all? {|ele| ele == mark }
        end 
        return false
    end

    def diagonal?(board, mark)
        x = board.length
        arr = []
        (0...x).each do |i|
            (0...x).each do |i2|
                if i == i2 
                arr << board[i][i2]
                end
            end 
        end 
        arr.all? {|ele| ele == mark }
    end

    def diagonal_win?(mark)
        new_board = @board.map { |sub| sub.reverse }
        diagonal?(new_board, mark) || diagonal?(@board, mark)
    end 

    def win?(mark)
        win_row?(mark) || win_col?(mark) || diagonal_win?(mark)
    end
    
    def empty_positions?
        @board.flatten.any?{|ele| ele == "_" }
    end
end
