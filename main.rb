$robots = []
# Toy Robot Challenge
def start
  puts 'Command:'
  parse_command(gets.strip)
end

def parse_command(command = '')
  bot_plus_inst = command.split(':')
  bot_name = bot_plus_inst[0].strip
  instruction = bot_plus_inst[1].strip
  run_instruction(bot_name, instruction)
end

def run_instruction(bot_name, instruction)
  # Check Bot Exists
  # Check Instruction Valid and Run
end

# Class to Instance each Robot
class Robot
  def initialize(name, x_pos = 0, y_pos = 0, facing = 'NORTH')
    @name = name
    @x_pos = x_pos
    @y_pos = y_pos
    @facing = facing
  end
end

start
