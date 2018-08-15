require './gameboard'
=begin

TODO
- split TicTacToe.play into separate methods
    module is not an answer
    modules can be called by an Object, not a Class

=end


class TicTacToe
    attr_accessor :player, :players, :board, :gameboard, :is_won, :the_winner
    @@rules = %q{

                        HOW TO PLAY TIC TAC TOE:
                    Player order is selected at random
                    Player selects an available location
                    Object of the game: get three in a row


                              VALID LOCATIONS
                      top_left | top_mid | top_right
                      mid_left | mid_mid | mid_right
                      bot_left | bot_mid | bot_right



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
        @turn = @players.sample

        while @count < 9

            # player makes a move // should be a separate method
            # def player_move
            loop do
                # a capitol %Q is used in order to use string interpolation
                $stdout.puts %Q{
                    #{@turn.name}, please select your move
                }
                $stdout.flush
                @location = gets.chomp.to_sym

                # needs to be updated
                if @board.table.has_key?(@location) && @board.table[@location] == nil
                    @board.table[@location] = @turn.symbol
                    break
                elsif @board.table[@location] != nil
                    puts %Q{
                That location is already taken. Please select a valid move

                        top_left | top_mid | top_right
                        mid_left | mid_mid | mid_right
                        bot_left | bot_mid | bot_right
                    }
                elsif !@board.table.has_key?(@location)
                    puts %Q{
                That location doesn't exist. Please select a valid move

                        top_left | top_mid | top_right
                        mid_left | mid_mid | mid_right
                        bot_left | bot_mid | bot_right
                    }
                end
            end


            # these things occur after each turn // should be a separate method
            # def check_for_winner
            @board.display_board

            # check_winner will go here
            @is_won = @board.check_winner

            # puts @is_won
            if @is_won == "X"
                puts "#{@p1.name} is the winner!".upcase
                break
            elsif @is_won == "O"
                puts "#{@p2.name.upcase} is the winner!".upcase
                break
            end

            @count += 1
            @turn == @p1 ? @turn = @p2 : @turn = @p1

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