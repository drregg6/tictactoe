class TicTacToe
    attr_accessor :player, :players, :gameboard, :table, :puts_table
    attr_reader :show_board

    def initialize(p1, p2)
        @p1 = Player.new(p1)
        @p2 = Player.new(p2)
        @players = []
        @players << @p1 << @p2
        # new table needs to be built with each new game
        @table = {
            top_left: nil,
            top_mid: nil,
            top_right: nil,
            mid_left: nil,
            mid_mid: nil,
            mid_right: nil,
            bot_left: nil,
            bot_mid: nil,
            bot_right: nil
        }
    end

    def puts_table
        puts @table
    end

    def make_board
        @top_left = @table[:top_left] == nil ? '_' : @table[:top_left]
        @top_mid = @table[:top_mid] == nil ? '|_|' : @table[:top_mid]
        @top_right = @table[:top_right] == nil ? '_' : @table[:top_right]
        @mid_left = @table[:mid_left] == nil ? '_' : @table[:mid_left]
        @mid_mid = @table[:mid_mid] == nil ? '|_|' : @table[:mid_mid]
        @mid_right = @table[:mid_right] == nil ? '_' : @table[:mid_right]
        @bot_left = @table[:bot_left] == nil ? ' ' : @table[:bot_left]
        @bot_mid = @table[:bot_mid] == nil ? '| |' : @table[:bot_mid]
        @bot_right = @table[:bot_right] == nil ? ' ' : @table[:bot_right]

        @board = [
            [@top_left, @top_mid, @top_right],
            [@mid_left, @mid_mid, @mid_right],
            [@bot_left, @bot_mid, @bot_right]
        ]
    end

    def show_board
        self.make_board.each do |row|
            puts row.join
        end
    end

    class Player
        attr_accessor :name
        attr_reader :symbol

        def initialize(name)
            @name = name
        end
    end
end

my_game = TicTacToe.new("Dave", "Regg")
puts my_game.players[1].name
puts my_game.players
my_game.show_board
# my_game.puts_table