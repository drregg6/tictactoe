require './gameboard'
=begin

TODO
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

    def initialize(p1=nil, p2=nil)
        # default symbols, cannot be accessed or changed
        @p1 = Player.new(p1, symbol="X")
        @p2 = Player.new(p2, symbol="O")
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


            # select a random player // should be a separate method
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


            # player makes a move // should be a separate method
            loop do
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
                    break
                elsif @board.table[@location] != nil
                    puts "That location is already taken. Please select a valid move"
                elsif !@board.table.has_key?(@location)
                    puts "That location doesn't exist. Please select a valid move"
                end
            end


            # these things occur after each turn // should be a separate method
            @board.display_board

            @count += 1

            # turn swaps after each turn
            if (@turn == 0)
                @turn = 1
            else
                @turn = 0
            end

            # check_winner will go here
        end
    end



    class Player
        attr_accessor :name
        attr_reader :symbol

        def initialize(name=nil, symbol)
            @symbol = symbol
            # names are optional, default will be PLAYER X or PLAYER O
            if name != nil
                @name = name
            else
                @name = "PLAYER #{symbol}"
            end
        end
    end
end


# example gameplay
my_game = TicTacToe.new("Dave", "Cynthia")
my_game.play