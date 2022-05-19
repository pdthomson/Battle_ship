class Computer
  attr_reader :computer_board

  def initialize(board)
    @computer_board = board
  end

  def letters
    letters = ["A", "B", "C", "D"]
    letters.sample
  end
end
