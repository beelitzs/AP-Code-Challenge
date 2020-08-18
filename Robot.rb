# Class to Instance each Robot
class Robot
  attr_reader :name, :x_pos, :y_pos, :facing
  def initialize(name, x_pos = 0, y_pos = 0, facing = 'north')
    @name = name
    @x_pos = x_pos
    @y_pos = y_pos
    @facing = facing
  end

  def move(x, y)
    @x_pos = x
    @y_pos = y
  end

  def left
    return @facing = 'west' if @facing == 'north'
    return @facing = 'south' if @facing == 'west'
    return @facing = 'east' if @facing == 'south'
    return @facing = 'north' if @facing == 'east'
  end

  def right
    return @facing = 'east' if @facing == 'north'
    return @facing = 'north' if @facing == 'west'
    return @facing = 'west' if @facing == 'south'
    return @facing = 'south' if @facing == 'east'
  end

  def report
    puts "Robot: #{@name}"
    puts "Location: X #{@x_pos}, Y #{@y_pos}"
    puts "Facing: #{@facing.upcase}"
  end
end