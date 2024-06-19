require './lib/board.rb'
require './lib/player.rb'

class Game 
    @@turn_count = 1
    @@winner = nil

    def initialize
        puts 'Welcome to Tic Tac Toe!'
        puts 'Player 1, please enter your name:'
        name = gets.chomp
        puts 'Player 1, please choose your symbol (X or O):'
        symbol1 = gets.chomp.upcase
        @player1 = Player.new(name, symbol1)
        symbol1 == 'X' ? symbol2 = 'O' : symbol2 = 'X'
        puts 'Player 2, please enter your name:'
        name = gets.chomp
        @player2 = Player.new(name, symbol2)

        @board = Board.new
        @board.display
    end

    def player_turn(turn)
        if turn.odd?
            puts "#{@player1.name}, please enter your move:"
            move = gets.chomp.split(',').map(&:to_i)
            until !is_already_taken?(move)
                puts 'This spot is already taken. Please enter a different move:'
                move = gets.chomp.split(',').map(&:to_i)
            end
            @board.update(move, @player1.symbol)
        else
            puts "#{@player2.name}, please enter your move:"
            move = gets.chomp.split(',').map(&:to_i)
            until !is_already_taken?(move)
                puts 'This spot is already taken. Please enter a different move:'
                move = gets.chomp.split(',').map(&:to_i)
            end
            @board.update(move, @player2.symbol)
        end
    end
    
    def is_already_taken?(move)
        row, col = move
        @board.board[row][col] != '_'
    end

    def check_winner
        win_conditions = [
            [[0, 0], [0, 1], [0, 2]],
            [[1, 0], [1, 1], [1, 2]],
            [[2, 0], [2, 1], [2, 2]],
            [[0, 0], [1, 0], [2, 0]],
            [[0, 1], [1, 1], [2, 1]],
            [[0, 2], [1, 2], [2, 2]],
            [[0, 0], [1, 1], [2, 2]],
            [[0, 2], [1, 1], [2, 0]]
        ]

        win_conditions.each do |condition|
            if condition.all? { |row, col| @board.board[row][col] == @player1.symbol }
                @@winner = @player1.name
            elsif condition.all? { |row, col| @board.board[row][col] == @player2.symbol }
                @@winner = @player2.name
            end
        end
    end

    def play
        while @@turn_count <= 9
            player_turn(@@turn_count)
            check_winner
            break if @@winner
            @@turn_count += 1
        end

        if @@winner
            puts "#{@@winner} wins!"
        else
            puts "It's a tie!"
        end
    end
end

game = Game.new
game.play