require "./lib/board"
require "./lib/cell"
require "./lib/ship"
require './lib/computer'
require './lib/player'
class Turn
  attr_reader :player_board, :computer_board, :submarine, :cruiser, :comp

  def initialize
    @player_board = Board.new
    @computer_board = Board.new
    @player = Player.new(@player_board)
    @comp = Computer.new(@computer_board)
    @submarine = Ship.new("Submarine", 2)
    @cruiser = Ship.new("Crusier", 3)
  end

  def main_menu
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit"
    user_input = gets.chomp.downcase
      if user_input == "p"
        display_board
      elsif user_input == "q"
        puts "This counts as a win for the PC's MWUAHAHA"
        exit
      else
        puts " I SAID PS OR QS"
        main_menu
      end
  end

  def display_board
    puts("============COMPUTER BOARD============")
    puts("#{@computer_board.board_render}")
    puts("============PLAYER BOARD==============")
    puts("#{@player_board.board_render(true)}")
  end

  def player_shot
  puts "Enter the coordinate of your shot:"
    loop do
    player_input = gets.chomp.upcase
      if @computer_board.valid_coordinate?(player_input) == false
        p "Please enter a valid coordinate"
        redo
      elsif @computer_board.cells[player_input].fired_upon? #&& @computer_board.cells.ship != nil
        p "You have already fired on #{player_input} NO TURN FOR YOU, jk try again"
      elsif @computer_board.valid_coordinate?(player_input) == true
         @computer_board.cells[player_input].fire_upon
         winner
         player_result(player_input)
      end
    end
  end

  def player_result(player_input)
    if @computer_board.cells[player_input].render == 'X'
      p "You have sunk this ship"
    elsif @computer_board.cells[player_input].render == 'H'#@computer_board.cells[player_input].ship != nil
      p "Your shot on #{player_input} hit a ship"
    elsif @computer_board.cells[player_input].render == 'M'
      p "Your shot on #{player_input} has missed"
    end
    display_board
    computer_shot
  end

  def computer_shot
    loop do
      computer_pick = @comp.computer_coordinates
      if @player_board.cells[computer_pick].fired_upon? == true
        redo
      elsif @player_board.cells[computer_pick].fire_upon
        winner
        computer_result(computer_pick)
      end
    end
  end

  def computer_result(computer_pick)
    if @player_board.cells[computer_pick].render == 'X'
      puts "I sunk your ship"
    elsif @player_board.cells[computer_pick].render == 'H'
      puts "My shot on #{computer_pick} hit a ship"
    else @player_board.cells[computer_pick].render == 'M'
      puts "My shot on #{computer_pick} has missed"
    end
    player_shot
    display_board
  end

  def player_sunk?
    @cruiser.sunk? && @submarine.sunk?
  end

  def computer_sunk?
    @comp.computer_cruiser.sunk? && @comp.computer_submarine.sunk?
  end

  def winner
    if computer_sunk?
      display_board
      puts "You win this time"
      exit
    elsif  player_sunk?
      display_board
      puts "I win again, No surprise"
      exit
    end
  end

  def turns
    loop do
      display_board
      player_shot
    end
  end

  def start
    main_menu
    @comp.place_cruiser
    @comp.place_submarine
    @player.player_setup
    turns
  end
end

turn = Turn.new
# # turn.display_board
# # turn.player_shot
# # turn.main_menu
# # turn.computer_shot
# # turn.computer_sunk
turn.start
