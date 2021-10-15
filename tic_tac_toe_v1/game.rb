require_relative "./board.rb"
require_relative "./human_player.rb"

class Game
    
    def initialize(player1_mark, player2_mark)
        @board = Board.new
        @player1 = Player.new(player1_mark)
        @player2 = Player.new(player2_mark)
        @curent_player = @player1
    end

    def switch_turn
        if @curent_player == @player1
            @curent_player = @player2
        else 
            @current_player = @player1   
        end
    end 
end

p Game.new(:X, :O)