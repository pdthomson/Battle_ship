require "./lib/board"
require "./lib/cell"
require "./lib/ship"
require "./lib/computer"


RSpec.describe(Computer) do
  before(:each) do
    @board = Board.new
    @computer = Computer.new(@board)
  end

  it("exists") do
    expect(@computer).to(be_an(Computer))
  end

  it("can give a random letters to guess") do
    expect(@computer.letters).to(be_an(String))
    expect(@computer.letters.length).to(eq(1))
  end

  it("can give a random number to guess") do
    expect(@computer.numbers).to(be_an(String))
    expect(@computer.numbers.length).to(eq(1))
  end

  it("can combine the random letter and number to give coordinate") do
    expect(@computer.letters.length).to(eq(1))
    expect(@computer.numbers.length).to(eq(1))
    expect(@computer.computer_coordinates.length).to(eq(2))
    expect(@computer.computer_coordinates).to(be_an(String))
  end
end
