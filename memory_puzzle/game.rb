require_relative "board.rb"
require_relative "card.rb"

class Game
    def initialize(size)
        @board = Board.new(size)
    end

    def play 
        until @board.won? do
            @board.render
            puts "You will select 2 cards"
            guess1=@board.guessed_pos
            guess2=@board.guessed_pos
            @board.reveal(guess1)
            p "_____________________"
            @board.reveal(guess2)
            if @board[guess1].value != @board[guess2].value
                @board[guess1].hide
                @board[guess2].hide
            end
            @board.render
        end
    end
end

game = Game.new(4)
game.play