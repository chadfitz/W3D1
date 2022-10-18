class Player
    def take_turn
        puts 'please input a letter'
        input = gets.chomp
        unless valid_play?(input)
            raise 'invalid play'
        end
    end
end