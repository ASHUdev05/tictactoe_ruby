class Board
    attr_reader :board
    
    def initialize
        @board = Array.new(3) { Array.new(3, '_') }
    end
    
    def display
        puts "  0 1 2"
        @board.each_with_index do |row, idx|
        puts "#{idx} #{row.join('|')}"
        puts "  -+-+-" unless idx == 2
        end
    end

    def update(move, symbol)
        row, col = move
        @board[row][col] = symbol
        display
    end
end