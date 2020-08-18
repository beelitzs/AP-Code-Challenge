# Toy Robot Challenge
require_relative 'GameRunner.rb'
require_relative 'Robot.rb'
@game_runner = GameRunner.new

def start
  puts 'Command:'
  parse_command(gets.strip)
end

def parse_command(command = '')
  bpi = @game_runner.bot_plus_inst(command)
  run_instruction(bpi[0].strip, bpi[1].strip)
end

def run_instruction(bot_name, instruction)
  return unless valid_instruction?(instruction)

  if !@game_runner.bot_exists?(bot_name)
    puts `No Robot exists with the name #{bot_name}`
  else
    puts 'testing code'
  end
end

def valid_instruction?(instruction)
  puts instruction
end

start
