class Game
    attr_accessor :fragment
    def initialize
        @player_1 = Player.new
        @player_2 = Player.new
        @dictionary = Dictionary.new
        @current_player = @player_1
    end

    def valid_play?(letter)
        alphabet = "abcdefghijklmnopqrstuvwxyz"
        if alphabet.include?(letter) && letter.length == 1
            @fragment += letter
            if @dictionary.include?(@fragment)
                return true
            else 
                return false
            end
        end
        false
    end

    def next_player!
        if @current_player == @player_1
            @current_player = @player_2
        else
            @current_player = @player_1
        end
    end

    def play_round

    end

    def win?

    end
end