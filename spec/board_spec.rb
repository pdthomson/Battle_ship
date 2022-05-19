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

  it("can check that the coordinate is valid") do
    expect(@board.valid_coordinate?("A1")).to(eq(true))
    expect(@board.valid_coordinate?("D4")).to(eq(true))
    expect(@board.valid_coordinate?("A5")).to(eq(false))
    expect(@board.valid_coordinate?("E1")).to(eq(false))
    expect(@board.valid_coordinate?("A22")).to(eq(false))
  end

  it "can check that the coordinates are the same length as the ship" do
    expect(@board.valid_placement?(@cruiser, ["A1", "A2"])).to eq(false)
    expect(@board.valid_placement?(@submarine, ["A2", "A3", "A4"])).to eq(false)
  end

  it "can check that the coordinates are consecutive" do
    expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A4"])).to eq(false)
    expect(@board.valid_placement?(@submarine, ["A1", "C1"])).to eq(false)
    expect(@board.valid_placement?(@cruilser, ["A3", "A2", "A1"])).to eq(false)
    expect(@board.valid_placement?(@submarine, ["C1", "B1"])).to eq(false)
  end

  it "can check that a placement is valid" do
    expect(@board.valid_placement?(@submarine, ["A1", "A2"])).to eq(true)
    expect(@board.valid_placement?(@cruiser, ["B1", "C1", "D1"])).to eq(true)
  end
end
