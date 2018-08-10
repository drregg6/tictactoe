=begin

should moves be underline?
should i go back to large squares?

the table will be dynamically updated
each time a player sets a move

after each move, .show_board will be fired
to show the updated gameboard

=end

class Gameboard
    attr_accessor :table, :board, :the_winner, :winning_tables

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
        puts "\n"
        create_board.each do |row|
            puts row.join.center(75)
        end
        puts "\n"
    end

    def winning_tables
        @winning_tables = {
            top: [@table[:top_left], @table[:top_mid], @table[:top_right]],
            mid_across: [@table[:mid_left], @table[:mid_mid], @table[:mid_right]],
            bot: [@table[:bot_left], @table[:bot_mid], @table[:bot_right]],
            left: [@table[:top_left], @table[:mid_left], @table[:bot_left]],
            mid_down: [@table[:top_mid], @table[:mid_mid], @table[:bot_mid]],
            right: [@table[:top_right], @table[:mid_right], @table[:bot_right]],
            dia_right: [@table[:top_left], @table[:mid_mid], @table[:bot_right]],
            dia_left: [@table[:top_right], @table[:mid_mid], @table[:bot_left]]
        }
    end

    def check_winner
        @the_winner = "HELLO WORLD"
        winning_tables.each_value do |arr|
            print arr.to_s + "\n"
            if !arr.include?(nil) && arr.uniq.size <= 1
                @the_winner = "WINNER"
            end
            # if array.all? { |locations| @table[locations] == 'x'} || array.all? { |locations| @table[locations] == "o"}
            #     @the_winner = 'HELLO WORLD'
            # end
            # array.each do |locations|
            #     puts @table[locations]
            # end
        end
        @the_winner
    end
end

# my_board = Gameboard.new
# my_board.display_board
# my_var = my_board.check_winner
# puts my_var
# my_board.table[:top_right] = 'x'
# my_board.display_board
# my_var = my_board.check_winner
# puts my_var