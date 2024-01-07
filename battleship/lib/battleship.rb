require_relative "board"
require_relative "player"

class Battleship

    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = @board.size * 0.5
    end


    def board
        @board
    end


    def player
        @player
    end

    def start_game
        board.place_random_ships
        puts board.size * 0.25
        puts board.print
    end


    def lose?
        if @remaining_misses < 1
            puts "you lose"
            return true
        else
            return false
        end
    end


    def win?
        if board.num_ships < 1
            puts "you win"
            return true
        else
            return false
        end
    end


    def game_over?
        if self.lose? || self.win?
            return true
        else
            return false
        end 
    end


    def turn
        pos = player.get_move
        if board.attack(pos)
            puts @remaining_misses
        else
            @remaining_misses -= 1
            puts @remaining_misses
        end

        puts board.print
    end
end
