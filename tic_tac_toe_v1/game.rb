require_relative "./board.rb"
require_relative "./human_player.rb"

class Game
    def initialize(player_1_mark, player_2_mark)
        @player_1 = Player.new(player_1_mark)
        @player_2 = Player.new(player_2_mark)
        @board = Board.new
        @curernt_player = @player_1
    end

    def switch_turn
        if @curernt_player == @player_1
            @curernt_player = @player_2
        else
            @curernt_player = @player_1
        end 
    end

    def play
        while @board.empty_positions?
            @board.print
            position = @curernt_player.get_position
            @board.place_mark(position, @curernt_player.mark)
            if @board.win?(@curernt_player.mark)
                p "victory, #{@current_player} wins"
                return 
            else
                self.switch_turn
            end 
        end 
        p "draw"
    end
    
end

