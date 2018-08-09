=begin

TODO
- IF square is taken, choose another one
- IF square doesn't exist, choose another one
- new method: check_for_winner
- IF check_for_winner is true, exit game

=end

class TicTacToe
    attr_accessor :player, :players, :board, :gameboard
    @@rules = %q{

        HOW TO PLAY TIC TAC TOE:
        - Player order is selected at random
        - Player selects an available location
        - Object of the game: get three in a row

    }

    def initialize(p1, p2)
        # default symbols, cannot be accessed or changed
        @p1 = Player.new(p1="Player One", symbol="X")
        @p2 = Player.new(p2="Player Two", symbol="O")
        @players = []
        @players << @p1 << @p2
        # new board needs to be built with each new game
        @board = Gameboard.new
        puts @@rules
    end

    def play
        @count = 0
        @turn = 0

        while @count < 9 # or if there's a winner
            # select a random player
            if @count == 0
                @player_turn = @players.sample

                # used to alternate between turns
                if @player_turn == @p1
                    @turn = 0
                else
                    @turn = 1
                end
            else
                @player_turn = @players[@turn]
            end

            # a capitol %Q is used in order to use string interpolation
            $stdout.puts %Q{
                #{@player_turn.name}, please select your move

                top_left | top_mid | top_right
                mid_left | mid_mid | mid_right
                bot_left | bot_mid | bot_right

            }
            $stdout.flush
            @location = gets.chomp.to_sym

            # needs to be updated
            if @board.table.has_key?(@location) && @board.table[@location] == nil
                @board.table[@location] = @player_turn.symbol
            else
                puts "ERROR"
            end

            # these things occur after each turn
            # check for winner will also be added here
            @board.display_board

            @count += 1

            # turn swaps after each turn
            if (@turn == 0)
                @turn = 1
            else
                @turn = 0
            end
        end
    end



    # Player just holds data
    class Player
        attr_accessor :name
        attr_reader :symbol

        def initialize(name, symbol)
            @name = name
            @symbol = symbol
        end
    end


    # Gameboard holds logic
    class Gameboard
        attr_accessor :table


        def initialize
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

        def create_board
            @top_left = @table[:top_left] == nil ? '_' : @table[:top_left]
            @top_mid = @table[:top_mid] == nil ? '|_|' : "|#{@table[:top_mid]}|"
            @top_right = @table[:top_right] == nil ? '_' : @table[:top_right]
            @mid_left = @table[:mid_left] == nil ? '_' : @table[:mid_left]
            @mid_mid = @table[:mid_mid] == nil ? '|_|' : "|#{@table[:mid_mid]}|"
            @mid_right = @table[:mid_right] == nil ? '_' : @table[:mid_right]
            @bot_left = @table[:bot_left] == nil ? ' ' : @table[:bot_left]
            @bot_mid = @table[:bot_mid] == nil ? '| |' : "|#{@table[:bot_mid]}|"
            @bot_right = @table[:bot_right] == nil ? ' ' : @table[:bot_right]

            @board = [
                [@top_left, @top_mid, @top_right],
                [@mid_left, @mid_mid, @mid_right],
                [@bot_left, @bot_mid, @bot_right]
            ]
        end

        def display_board
            puts "\n\n\n"
            create_board.each do |row|
                puts row.join
            end
            puts "\n\n\n"
        end
    end
end


# example gameplay
my_game = TicTacToe.new("Dave", "Regg")
my_game.play