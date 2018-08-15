=begin

TODO
- split TicTacToe.play into separate methods

=end

require './gameboard'
require './player'

class TicTacToe
    attr_accessor :player, :players, :board, :gameboard, :is_won, :the_winner
    @@rules = %q{

                        HOW TO PLAY TIC TAC TOE:
                    Player order is selected at random
                    Player selects an available location
                    Object of the game: get three in a row

    }
    @@grid = %q{

                          VALID LOCATIONS
                    top_left | top_mid | top_right
                    mid_left | mid_mid | mid_right
                    bot_left | bot_mid | bot_right

    }

    def initialize(p1=nil, p2=nil)
        # default symbols, cannot be accessed or changed
        @p1 = Player.new(p1, symbol="X")
        @p2 = Player.new(p2, symbol="O")
        @board = Gameboard.new
        @players = [@p1, @p2]
        # new board needs to be built with each new game
        puts @@rules
        puts @@grid
    end

    def play
        @count = 0
        @turn = @players.sample

        while @count < 9

            # player makes a move // should be a separate method
            loop do
                # a capitol %Q is used in order to use string interpolation
                $stdout.puts %Q{
                    #{@turn.name}, please select your move
                }
                $stdout.flush
                @location = gets.chomp.to_sym

                if @board.table.has_key?(@location) && @board.table[@location] == nil
                    @board.table[@location] = @turn.symbol
                    break
                elsif @board.table[@location] != nil
                    puts "\n\nThat location is already taken".center(75)
                    puts @@grid
                elsif !@board.table.has_key?(@location)
                    puts "\n\nThat location doesn't exist".center(75)
                    puts @@grid
                end
            end


            # these things occur after each turn
            @board.display_board
            break if @board.check_for_winner(@turn.name) == true
            @count += 1
            @turn == @p1 ? @turn = @p2 : @turn = @p1

        end
    end
end


# example gameplay
my_game = TicTacToe.new("Dave", "Cynthia")
my_game.play