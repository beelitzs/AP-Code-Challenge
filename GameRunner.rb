require_relative 'Robot.rb'
# Class to hold instanced game data
class GameRunner
  attr_reader :robots

  def initilize
    @robots = [].new
  end

  def bot_exists?(name)
    return false unless @robots
  
    @robots.each do |robot|
      if robot.name == name
        return true
      end
    end
    false
  end

  def valid_instruction?(instruction)
    type = instruction.split(' ')[0]
    %w[place report move left right].each do |valid_type|
      return true if valid_type == type
    end
    puts 'Instruction is invalid, try again.'
  end

  def parse_instruction(bot_name, instruction)
    case instruction_type(instruction)
    when 'place'
      parse_place_instruction(bot_name, instruction)
    when 'report'
      report(bot_name)
    when 'move'
      move(bot_name)
    when 'left'
      left(bot_name)
    when 'right'
      right(bot_name)
    end
  end

  def parse_place_instruction(bot_name, instruction)
    separated = instruction[5..-1].split(',')
    x_pos = separated[0].strip.to_i
    y_pos = separated[1].strip.to_i
    facing = get_facing(separated[2].downcase.strip)
    place(bot_name.downcase, x_pos, y_pos, facing)
  end

  def get_facing(facing)
    north_names = %w[n north 0]
    return 'north' if north_names.include?(facing)
    east_names = %w[e east 1]
    return 'east' if east_names.include?(facing)
    south_names = %w[s south 2]
    return 'south' if south_names.include?(facing)
    west_names = %w[w west 3]
    return 'west' if west_names.include?(facing)
  end

  def instruction_type(instruction)
    instruction.split(' ')[0]
  end

  def bot_plus_inst(cmd)
    cmd.split(':')
  end

  def get_bot_by_name(name)
    return unless @robots
    @robots.each do |robot|
      return robot if robot.name == name
    end
  end

  def can_move?(x, y)
    return true if valid_space?(x, y) && !collision?(x, y)
    false
  end

  def valid_space?(x, y)
    if x.to_i < 0 || x.to_i > 5 || y.to_i < 0 || y.to_i > 5
      puts 'Robot cannot leave the allowable area.'
      return false
    end
    true
  end

  def collision?(x, y)
    return false unless @robots
    @robots.each do |robot|
      if robot.x_pos == x && robot.y_pos == y
        puts 'Cannot move there, another robot is in that location.'
        return true
      end
    end
    false
  end

  def name_taken?(name)
    return false unless @robots
    @robots.each do |robot|
      if robot.name == name
        puts 'That name is already in use by another robot.'
        return true
      end
    end
    false
  end

  def place(name, x_pos, y_pos, facing)
    return if name_taken?(name)
    return unless can_move?(x_pos, y_pos)
    robot = Robot.new(name, x_pos.to_i, y_pos.to_i, facing)
    if @robots
      @robots << robot
    else
      @robots = [robot]
    end
    puts "#{name} has been added to the board."
  end

  def calculate_move_x(bot)
    return bot.x_pos - 1 if bot.facing == 'west'
    return bot.x_pos + 1 if bot.facing == 'east'
    return bot.x_pos
  end

  def calculate_move_y(bot)
    return bot.y_pos - 1 if bot.facing == 'south'
    return bot.y_pos + 1 if bot.facing == 'north'
    return bot.y_pos
  end

  def move(name)
    bot = get_bot_by_name(name)
    x_pos = calculate_move_x(bot)
    y_pos = calculate_move_y(bot)
    return unless can_move?(x_pos, y_pos)
    bot.move(x_pos, y_pos)
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