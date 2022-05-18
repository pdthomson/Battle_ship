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

  def render(debug_ship = false)
    if empty? == false && @fire_upon == true && @ship.sunk?
      'X'
    elsif @fire_upon == true && empty? == false
      'H'
    elsif debug_ship == true && empty? == false
      'S'
    elsif @fire_upon && empty? == true
      'M'
    else
      '.'
    end
  end
end
