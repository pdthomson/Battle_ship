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
end
