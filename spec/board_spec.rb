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

  it("can check that the coordinates are the same length as the ship") do
    expect(@board.valid_placement?(@cruiser, ["A1", "A2"])).to(eq(false))
    expect(@board.valid_placement?(@submarine, ["A2", "A3", "A4"])).to(eq(false))
  end

  it("can check that the coordinates are consecutive") do
    expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A4"])).to(eq(false))
    expect(@board.valid_placement?(@submarine, ["A1", "C1"])).to(eq(false))
    expect(@board.valid_placement?(@cruiser, ["A3", "A2", "A1"])).to(eq(false))
    expect(@board.valid_placement?(@submarine, ["C1", "B1"])).to(eq(false))
  end

  it("can check that a placement is valid") do
    expect(@board.valid_placement?(@submarine, ["A1", "A2"])).to(eq(true))
    expect(@board.valid_placement?(@cruiser, ["B1", "C1", "D1"])).to(eq(true))
  end

  it("can place a ship on the board") do
    @board.place(@cruiser, ["A1", "A2", "A3"])
    cell1 = @board.cells["A1"]
    cell2 = @board.cells["A2"]
    cell3 = @board.cells["A3"]
    expect(cell1.ship).to(eq(@cruiser))
    expect(cell2.ship).to(eq(@cruiser))
    expect(cell3.ship).to(eq(@cruiser))
    expect(cell3.ship == cell2.ship).to(eq(true))
  end

  it("can check for overlapping ship ") do
    @board.place(@cruiser, ["A1", "A2", "A3"])
    expect(@board.valid_placement?(@submarine, ["A1", "B1"])).to(eq(false))
  end

  it "can render a full board" do
    @board.place(@cruiser, ["A1", "A2", "A3"])
    expect(@board.board_render).to eq(
      "1 2 3 4 \n" +
      "A . . . . \n" +
      "B . . . . \n" +
      "C . . . . \n" +
      "D . . . . \n"
    )
    expect(@board.board_render(true)).to eq(
      "1 2 3 4 \n" +
      "A S S S . \n" +
      "B . . . . \n" +
      "C . . . . \n" +
      "D . . . . \n"
    )
  end
end
