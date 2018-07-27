class TicTacToe
    attr_accessor :player, :players, :gameboard
    attr_reader :show_board

    def initialize(p1, p2)
        @p1 = Player.new(p1)
        @p2 = Player.new(p2)
        @players = []
        @players << @p1 << @p2
    end

    def make_board

        # this will have if statements
        # if :top_left = nil '_' else whoever owns the square

        @top_left = '_'
        @top_mid = '|_|'
        @top_right = '_'
        @mid_left = '_'
        @mid_mid = '|_|'
        @mid_right = '_'
        @bot_left = ' '
        @bot_mid = '| |'
        @bot_right = ' '

        @board = [
            [@top_left, @top_mid, @top_right],
            [@mid_left, @mid_mid, @mid_right],
            [@bot_left, @bot_mid, @bot_right]
        ]
    end

    def show_board
        # @board = %q(
        #      |     |
        #   x  |  x  |  x
        # _____|_____|_____
        #      |     |
        #   x  |  x  |  x
        # _____|_____|_____
        #      |     |
        #   x  |  x  |  x
        #      |     |
        #  )
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
my_game.show_board