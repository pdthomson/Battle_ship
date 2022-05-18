require "./lib/board"
require "./lib/cell"
require "./lib/ship"


RSpec.describe(Board) do
  before(:each) do
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  it("exists") do
    expect(@board).to(be_an(Board))
  end

  it("has attributes") do
    expect(@board.cells).to(be_an(Hash))
    expect(@board.cells.length).to(eq(16))
    expect(@board.cells["A1"]).to(be_an(Cell))
  end
end
