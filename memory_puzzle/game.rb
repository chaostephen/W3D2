require_relative "board.rb"
require_relative "card.rb"

class Game
    def initialize(size)
        @board = Board.new(size)
    end
end