class Player
  attr_reader :player_board, :computer_board

  def initialize(board)
    @player_board = board
    @computer_board = board
    @submarine = Ship.new("Submarine", 2)
    @crusier = Ship.new("Crusier", 3)
  end
end
