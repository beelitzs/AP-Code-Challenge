require_relative 'Robot.rb'
# Class to hold instanced game data
class GameRunner
  attr_reader :robots

  def initilize
    @robots = []
  end

  def bot_exists?(name)
    return false if robots.empty?
  
    @robots.each do |robot|
      return true if robot.name == name
    end
    false
  end

  def bot_plus_inst(cmd)
    cmd.split(':')
  end

  def get_bot_by_name(name)
    @robots.each do |robot|
      return robot if robot.name == name
    end
  end

  def place(name, x_pos, y_pos, facing)
    robot = Robot.new(name, x_pos, y_pos, facing)
    @robots << robot
  end

  def move(name)
    get_bot_by_name(name).move
  end

  def left(name)
    get_bot_by_name(name).left
  end

  def right(name)
    get_bot_by_name(name).right
  end

  def report(name)
    get_bot_by_name(name).report
  end
end