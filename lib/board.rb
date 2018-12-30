class Board 
    def initialize
        @cells = Array.new(9, ' ')
    end

    def printed_board
       puts board = "
            
            0 | 1 | 2
            _________
            3 | 4 | 5
            _________
            6 | 7 | 8
        "
    end

    def array_of_position
        board = ""
        (0..8).step(3) do |i|
            board += "#{@cells[i]} | #{@cells[i + 1]} | #{@cells[i + 2]} \n"
        end
        puts "#{board}"
    end

    def position_in_board(position, symbol)
        @cells[position] = symbol 
    end

     def cell_taken?(position)
         @cells[position] == "x" || @cells[position] == 'o'
        
      end


end



