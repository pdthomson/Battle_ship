require "./lib/board"
require "./lib/cell"
require "./lib/ship"
require "./lib/computer"
require "./lib/player"
require "./lib/turn"


RSpec.describe(Turn) do
  before(:each) do
    @turn = Turn.new
    @board = Board.new
    @player = Player.new(@board)
  end

  it("exists") do
    expect(@turn).to(be_an(Turn))
  end
end
