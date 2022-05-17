class Cell
  attr_reader :coordinate, :ship, :fire_upon

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fire_upon = false
  end

  def empty?
    if @ship == nil
      true
    else
      false
    end
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fire_upon
  end

  def fire_upon
    if empty? == false
      @ship.hit
    end

    @fire_upon = true
  end
end
