# Toy Robot Challenge
require_relative 'GameRunner.rb'
require_relative 'Robot.rb'
@game_runner = GameRunner.new

def start
  puts 'Command:'
  parse_command(gets.strip)
  puts "Bots on board: #{@game_runner.robots}"
  start
end

def parse_command(command = '')
  bpi = @game_runner.bot_plus_inst(command)
  run_instruction(bpi[0].downcase.strip, bpi[1].strip)
end

def run_instruction(bot_name, instruction)
  cleaned_instruction = instruction.downcase.strip
  return unless @game_runner.valid_instruction?(cleaned_instruction)

  #unless @game_runner.bot_exists?(bot_name)
  #  puts "No Robot exists with the name #{bot_name}"
  #  return unless cleaned_instruction[0..4] == 'place'
  #end
  @game_runner.parse_instruction(bot_name, cleaned_instruction.downcase)
end

start
