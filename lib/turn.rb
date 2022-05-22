require "./lib/board"
require "./lib/cell"
require "./lib/ship"

class Turn
  attr_reader :player_board, :computer_board, :submarine, :cruiser

  def initialize
    @player_board = Board.new
    @computer_board = Board.new
    @submarine = Ship.new("Submarine", 2)
    @cruiser = Ship.new("Crusier", 3)
  end

  def display_board
    puts("============COMPUTER BOARD============")
    puts("#{@computer_board.board_render}")
    puts("============PLAYER BOARD==============")
    puts("#{@player_board.board_render}")
  end

  def player_shot
    puts("Enter the coordinate for your shot:")

    loop do
      player_input = gets.chomp.upcase

      if @computer_board.valid_coordinate?(player_input) == false
        puts("please enter a vaild coordinate")
      end

      if @computer_board.cells[player_input].render == "X"
        puts("You have sunk the ship")
      elsif @computer_board.cells[player_input].render == "H"
        puts("your shot on #{player_input} hit a ship")
      elsif @computer_board.cells[player_input].render == "M"
        puts("your shot on #{player_input} has missed")
      else
        @computer_board.cells[player_input].fired_upon?
        puts("You have already fired upon #{player_input} NO TURN FOR YOU")
      end

      break
    end
  end
end

board = Board.new
turn = Turn.new
turn.display_board
