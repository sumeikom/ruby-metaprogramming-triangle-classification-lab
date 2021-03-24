require 'pry'
class Triangle
  attr_reader :side1, :side2, :side3, :all_sides

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3

    @all_sides = [side1, side2, side3].sort
  end

  def valid_triangle?
    self.all_sides.any? {|sides| sides < 0} || all_sides[0] + all_sides[1] <= all_sides[2]
  end

  def triangle_type
    triangle_type = ''
    if self.all_sides.uniq.length == 1
      triangle_type = :equilateral
    elsif self.all_sides.uniq.length == 2
      triangle_type = :isosceles
    else
      triangle_type = :scalene
    end
    triangle_type
  end

  def kind
  #  binding.pry
    if self.valid_triangle?
      begin
        raise TriangleError
      end
    elsif self.triangle_type == :equilateral
      :equilateral
    elsif self.triangle_type == :isosceles
      :isosceles
    else
      :scalene
    end
  end

  class TriangleError < StandardError

  end
end