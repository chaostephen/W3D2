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

    def render
        @grid
    end

    def won?
        (0...@grid.length).each do |row|
            (0...@grid.length).each do |col|
                return false if @grid[row][col].shown == false
            end
        end
        true
    end

    def guessed_pos
        puts "Enter a position in the format: X Y"
        string = gets.chomp.to_s.split(" ")
        array = string.map { |x| x.to_i }
        array
    end

    def reveal(pos)
        if @grid[pos[0]][pos[1]].shown == false
            @grid[pos[0]][pos[1]].reveal
        end
        @grid[pos[0]][pos[1]].value
    end
end

# board1=Board.new(3)
# board1.populate
# p board1