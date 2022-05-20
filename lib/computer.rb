class Computer
  attr_reader :computer_board,
              :submarine,
              :cruiser

  def initialize(board)
    @computer_board = board
    @submarine = Ship.new("Submarine", 2)
    @cruiser = Ship.new("Cruiser", 3)
  end

  def letters
    letters = ["A", "B", "C", "D"]
    letters.sample
  end

  def numbers
    numbers = ["1", "2", "3", "4"]
    numbers.sample
  end

  def computer_coordinates
    letters + numbers
  end

  def place_submarine
    loop do
      submarine_coordinates = []
      @submarine.length.times do
        submarine_coordinates << computer_coordinates
      end
      submarine_coordinates.sort
      if @computer_board.valid_placement?(@submarine, submarine_coordinates) == true
        @computer_board.place(@submarine, submarine_coordinates)
        break
      end
    end
  end
end
