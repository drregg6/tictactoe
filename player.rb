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