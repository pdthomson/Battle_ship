require './lib/ship'
require './lib/cell'
class Board
  attr_reader :cells

  def initialize
    @cells = {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4"),
    }
  end

  def valid_coordinate?(coordinate)
    @cells.has_key?(coordinate)
  end

  def valid_placement?(ship, coordinates)
    letters = coordinates.map { |letter| letter[0] }
    numbers = coordinates.map { |number| number[1] }
    occupied = coordinates.map { |piece| @cells[piece].empty? }
    if ship.health != coordinates.count
      false
    elsif occupied.include?(false) == true
      false
    elsif letters.uniq.count == 1 && (numbers.min..numbers.max).to_a == numbers
      true
    elsif (letters.min..letters.max).to_a == letters && numbers.uniq.count == 1
      true
    elsif (letters.min..letters.max).to_a == letters && (numbers.min..numbers.max).to_a == numbers
      false
    elsif letters.uniq.length == 1 && numbers.uniq.length == numbers
      false
    else
      false
    end
  end

  def place(ship, coordinates)
    coordinates.map { |key| @cells[key].place_ship(ship) }
  end

  def board_render(debug_ship = false)
    "1 2 3 4 \n" +
    "A #{@cells["A1"].render(debug_ship)} #{@cells["A2"].render(debug_ship)} #{@cells["A3"].render(debug_ship)} #{@cells["A4"].render(debug_ship)} \n" +
    "B #{@cells["B1"].render(debug_ship)} #{@cells["B2"].render(debug_ship)} #{@cells["B3"].render(debug_ship)} #{@cells["B4"].render(debug_ship)} \n" +
    "C #{@cells["C1"].render(debug_ship)} #{@cells["C2"].render(debug_ship)} #{@cells["C3"].render(debug_ship)} #{@cells["C4"].render(debug_ship)} \n" +
    "D #{@cells["D1"].render(debug_ship)} #{@cells["D2"].render(debug_ship)} #{@cells["D3"].render(debug_ship)} #{@cells["D4"].render(debug_ship)} \n"
  end
end
