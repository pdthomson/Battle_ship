class Computer
  attr_reader :computer_board

  def initialize(board)
    @computer_board = board
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
end
