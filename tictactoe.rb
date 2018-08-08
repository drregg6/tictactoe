=begin

Player should be its own class?
Player doesn't seem to be accessible unless you put in TicTacToe

TODO
- random player's turn, then swap back and forth
- add IF statements
- IF square is taken, choose another one
- IF square doesn't exist, choose another one
- new method: check_for_winner
- IF check_for_winner is true, exit game
- display rules upon initialize

=end

class TicTacToe
    attr_accessor :player, :players, :board, :gameboard
    @@rules = %q{

        HOW TO PLAY TIC TAC TOE:
        - sing a song
        - play a long
        - give up

    }

    def initialize(p1, p2)
        # default symbols, cannot be accessed or changed
        # will have "random" for game order
        # where game states "player.name"s turn to go
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

        while @count < 3
            # if @count == 0
            #     @player = players.sample
            # else
            #     @player == #opposite player
            # end

            $stdout.puts "Please enter your move"
            $stdout.flush
            @location = gets.chomp.to_sym
            if @board.table.has_key?(@location) && @board.table[@location] == nil
                @board.table[@location] = 'x'
            else
                puts "ERROR"
            end
            @board.display_board

            @count += 1
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
puts my_game.players[1].name
puts my_game.players[1].symbol
puts my_game.players
# my_game.display_board
# my_game.move(@p1, :mid_mid)
my_game.board.display_board
my_game.play