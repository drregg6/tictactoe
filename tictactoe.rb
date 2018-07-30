=begin

Player should be its own class?
Player doesn't seem to be accessible unless you put in TicTacToe

=end

class TicTacToe
    attr_accessor :player, :players, :gameboard, :table, :puts_table
    attr_reader :show_board

    def initialize(p1, p2)
        # default symbols, cannot be accessed or changed
        # will have "random" for game order
        # where game states "player.name"s turn to go
        @p1 = Player.new(p1, symbol="X")
        @p2 = Player.new(p2, symbol="O")
        @players = []
        @players << @p1 << @p2
        # new table needs to be built with each new game
        @table = Gameboard.new
    end

    def move(player, location)
        if @table.has_key?(location) && @table[location] == nil
            @table[location] = @players[0].symbol
        end
    end

    class Player
        attr_accessor :name
        attr_reader :symbol

        def initialize(name, symbol)
            @name = name
            @symbol = symbol
        end
    end
end


# example gameplay
my_game = TicTacToe.new("Dave", "Regg")
puts my_game.players[1].name
puts my_game.players[1].symbol
puts my_game.players
my_game.display_board
my_game.move(@p1, :mid_mid)
my_game.display_board