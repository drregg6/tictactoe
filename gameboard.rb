=begin

should moves be underline?
should i go back to large squares?

the table will be dynamically updated
each time a player sets a move

after each move, .show_board will be fired
to show the updated gameboard

=end

class Gameboard
    attr_accessor :table, :board

    @@winners = {
        top: [:top_left, :top_mid, :top_right],
        mid_across: [:mid_left, :mid_mid, :mid_right],
        bot: [:bot_left, :bot_mid, :bot_right],
        left: [:top_left, :mid_left, :bot_left],
        mid_down: [:top_mid, :mid_mid, :bot_mid],
        right: [:top_right, :mid_right, :bot_right],
        dia_right: [:top_left, :mid_mid, :bot_right],
        dia_left: [:top_right, :mid_mid, :bot_left]
    }

    def initialize
        @table = {
            top_left: 'x',
            top_mid: 'x',
            top_right: 'x',
            mid_left: nil,
            mid_mid: nil,
            mid_right: 'o',
            bot_left: nil,
            bot_mid: 'x',
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
        create_board.each do |row|
            puts row.join
        end
    end

    def check_winner
        @@winners.each_value do |array|
            print array.to_s + "\n"
            if array.all? { |locations| @table[locations] == "x"}
                puts "WINNER"
            elsif array.all? { |locations| @table[locations] == "o"}
                puts "WINNER"
            end
            # array.each do |locations|
            #     puts @table[locations]
            # end
        end
    end
end

my_board = Gameboard.new
my_board.display_board
my_board.check_winner