require_relative "card.rb"
# require_relative "game.rb"
class Board
    def initialize(size=4)
        @grid = Array.new(size){Array.new(size)}
    end

    def populate
        array="23456789TJQKA".split("")
        elements=(@grid.length**2)/2
        rand_cards=array.sample(elements)
        rand_cards+=rand_cards
        (0...@grid.length).each do |row|
            (0...@grid.length).each do |col|
                @grid[row][col]=Card.new(rand_cards.shift,false)
            end
        end
    end

    def render
        @grid.each do |row|
            arr=[]
            row.each do |card|
                if card.shown==false
                    arr<<"_"
                else
                    arr<<card.value
                end
            end
            puts arr.join(" ")
        end
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

    def [](pos)
        @grid[pos[0]][pos[1]]
    end
end

board1=Board.new(4)
board1.populate
board1.render
board1.reveal([0, 0])
board1.render