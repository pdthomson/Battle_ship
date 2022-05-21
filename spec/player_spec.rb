require "./lib/board"
require "./lib/cell"
require "./lib/ship"
require "./lib/computer"
require "./lib/player"


RSpec.describe(Player) do
  before(:each) do
    @board = Board.new
    @player = Player.new(@board)
  end

  it("exists") do
    expect(@player).to(be_an(Player))
  end
end
