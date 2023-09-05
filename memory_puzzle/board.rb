require_relative "card.rb"
# require_relative "game.rb"
class Board
    def initialize(size)
        @grid = Array.new(size){Array.new(size)}
    end

    def populate
        array="23456789TJQKA".split("")
        (0...@grid.length).each do |row|
            (0...@grid.length).each do |col|
                @grid[row][col]=Card.new(array.sample,false)
            end
        end
    end
end

# board1=Board.new(3)
# board1.populate
# p board1