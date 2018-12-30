require './board'
require './player'
class Game 
    def initialize
        @print = Board.new
        @player1 = Player.new
        @player2 = Player.new
        @game = true
        
    end

    def start_the_game
        puts "welcome"
        puts "player 1 choose a name"
        @player1.name = gets.chomp
        puts ""
        allocate_symbol
        puts "#{@player1.name} your symbol is : #{@player1.symbol}"
        puts ""
        puts "player 2 choose a name"
        @player2.name = gets.chomp
        puts ""
        puts "#{@player2.name} your symbol is : #{@player2.symbol}"
        puts ""
        current_player
        puts "#{@current_player.name} you go first "
        puts "this is a board to help you choose position"
        @print.printed_board
        @print.array_of_position
        puts ""
        
    end

    def allocate_symbol
        @player1.symbol = 'x'
        @player2.symbol = 'o'
    end

    def current_player
        @current_player = [@player1, @player2].sample
    end

    def change_turn
       @current_player == @player1 ? @current_player = @player2 : @current_player = @player1
    end

    def turn(player)
        #@print.printed_board
        #@print.array_of_position
         #current_player
         puts "#{@current_player.name} choose a number between 0-8"
         @current_player.position = gets.chomp.to_i 
         if @current_player.position < 0 || @current_player.position > 8
          puts "choose a number between 0-8"
          @current_player.position = gets.chomp.to_i
         end
         if @print.cell_taken?(@current_player.position)
            puts "the cells is already taken"
            @current_player.position = gets.chomp.to_i
         end
          @current_player.cells_taken <<  @current_player.position
         #p @current_player.cells_taken
         #@current_player.symbol = allocate_symbol
         @print.position_in_board(@current_player.position, @current_player.symbol)   
         @print.array_of_position
    end

    def take_turn
        start_the_game
        while(@game)
        turn(@current_player)
        @print.printed_board
        winning_cells
        change_turn
        end
    end

    def winning_cells
        conditions = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

        conditions.each do |condition| 
            #puts condition.inspect
            if (condition - @current_player.cells_taken).empty?
                puts "#{@current_player.name} win"
                @game = false
            end
        end
        if (@player1.cells_taken.size + @player2.cells_taken.size >= 9)
            puts "it's a draw"
            @game = false
        end
    end
    
    
end


game = Game.new
game.take_turn