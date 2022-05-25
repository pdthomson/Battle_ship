class Player
  attr_reader :player_board, :computer_board

  def initialize(board)
    @player_board = board
    @computer_board = board
    @submarine = Ship.new("Submarine", 2)
    @cruiser = Ship.new("Crusier", 3)
  end

  def player_setup
    puts("I have laid out my ships on the grid \n" + "You now need to lay out your ships. \n" + "The Cruiser is #{@cruiser.length} units long and the Submarine is #{@submarine.length} units long. \n" + "#{@player_board.board_render} \n" + "Enter the squares for the Cruiser, one at time.(3 spaces):")
    cruiser_placed = false
    while cruiser_placed == false
      player_cruiser_coordinates = []

      until player_cruiser_coordinates.count == @cruiser.length
        user_coordinates = gets.chomp.upcase

        if @player_board.valid_coordinate?(user_coordinates) == false
          puts("That is and invalid coordinate. Please try again:")
        else
          player_cruiser_coordinates << user_coordinates
        end
      end


      if @player_board.valid_placement?(@cruiser, player_cruiser_coordinates) == false
        puts("Those are not valid coordinates. Please try again:")
      else
        @player_board.place(@cruiser, player_cruiser_coordinates)
        puts(@player_board.board_render(true))
        cruiser_placed = true
        break
      end
    end

    puts("Enter the squares for the Submarine (2 spaces):")
    submarine_placed = false
    while submarine_placed == false
      player_submarine_coordinates = []

      until player_submarine_coordinates.count == @submarine.length
        user_coordinates = gets.chomp.upcase

        if @player_board.valid_coordinate?(user_coordinates) == false
          puts("That is and invalid coordinate. Please try again:")
        else
          player_submarine_coordinates << user_coordinates
        end
      end


      if @player_board.valid_placement?(@submarine, player_submarine_coordinates) == false
        puts("Those are not valid coordinates. Please try again:")
      else
        @player_board.place(@submarine, player_submarine_coordinates)
        puts(@player_board.board_render(true))
        submarine_placed = true
        break
      end
    end
  end
end
