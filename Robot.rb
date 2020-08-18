# Class to Instance each Robot
class Robot
  attr_reader :name, :x_pos, :y_pos, :facing
  def initialize(name, x_pos = 0, y_pos = 0, facing = 'NORTH')
    @name = name
    @x_pos = x_pos
    @y_pos = y_pos
    @facing = facing
  end

  def move

  end

  def left

  end

  def right

  end

  def report

  end
end