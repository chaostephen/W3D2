require_relative "board.rb"
require_relative "card.rb"

class Game
    def initialize(size)
        @board = Board.new(size)
    end

    def play
        @board.render
        puts "You will select 2 cards"
        guess1=@board.guessed_pos
        guess2=@board.guessed_pos
        @board.reveal(guess1)
        p "_____________________"
        @board.reveal(guess2)
        @board.render
    end
end