require "./lib/board"
require "./lib/cell"
require "./lib/ship"
require './lib/computer'
class Turn
  attr_reader :player_board, :computer_board, :submarine, :cruiser, :comp

  def initialize
    @player_board = Board.new
    @computer_board = Board.new
    @submarine = Ship.new("Submarine", 2)
    @cruiser = Ship.new("Crusier", 3)
    @comp = Computer.new(@computer_board)
    @computer_shot_array = []
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
        break
      end
    end
    winner
    computer_shot
  end

  def computer_shot
    computer_pick = @comp.computer_coordinates
    @computer_shot_array << computer_pick

    if @computer_shot_array.include?(computer_pick)
      computer_pick
    else
      @player_board.cells[computer_pick].fire_upon
    end

    if @player_board.cells[computer_pick].render == "X"
      puts("I sunk your ship")
    elsif @player_board.cells[computer_pick].render == "H"
      puts("My shot #{computer_pick} has hit a ship")
    else
      @player_board.cells[computer_pick].render == "M"
      puts("My shot #{computer_pick} has missed")
    end
    winner
    player_shot
  end

  def player_sunk?
    @cruiser.sunk? && @sumbarine.sunk?
  end

  def computer_sunk?
    @comp.cruiser.sunk? && @comp.submarine.sunk?
  end

  def winner
    player_sunk? || computer_sunk?
  end

  def turns
    until winner
      display_board
      player_shot
      if winner && player_sunk?
        puts "You win this time"
      else
        winner && computer_sunk?
        puts "I win again, No surprise"
      end
    end
  end
end

board = Board.new
turn = Turn.new
turn.player_shot
