module Tools
    def swap_turn
        if @count == 0
            @player_turn = @players.sample

            @player_turn == @p1 ? @turn = 0 : @turn = 1
        else
            @turn == 0 ? @turn = 1 : @turn = 0

            @player_turn = @players[@turn]
        end
    end
end