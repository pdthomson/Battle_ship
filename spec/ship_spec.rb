require "./lib/ship"


RSpec.describe(Ship) do
  before(:each) do
    @cruiser = Ship.new("Cruiser", 3)
  end

  it("exists") do
    expect(@cruiser).to(be_an(Ship))
  end

  it("has attributes") do
    expect(@cruiser.name).to(eq("Cruiser"))
    expect(@cruiser.health).to(eq(3))
  end

  it("check ships length") do
    expect(@cruiser.length).to(eq(3))
  end

  it("can check if a ship has sunk") do
    expect(@cruiser.health).to(eq(3))
    expect(@cruiser.sunk?).to(eq(false))
  end

  it("can check if a ship was hit") do
    expect(@cruiser.health).to(eq(3))
    expect(@cruiser.sunk?).to(eq(false))
    @cruiser.hit
    expect(@cruiser.health).to(eq((2)))
    @cruiser.hit
    expect(@cruiser.health).to(eq(1))
    @cruiser.hit
    expect(@cruiser.sunk?).to(eq(true))
  end
end
