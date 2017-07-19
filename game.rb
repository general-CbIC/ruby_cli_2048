require './bin/game'

VERSION = '0.0.4'

def show_menu
  system 'clear'
  puts 'Choose variant:'
  puts '1. Start game'
  puts '2. Help'
  puts '0. Exit'
  answer = gets.chomp
  show_menu if answer.to_i > 2 || answer.to_i < 0
  if answer == '1'
    game = Game.new
    game.start_game
  end
  show_help if answer == '2'
  exit if answer == '0'
end

def show_help
  system 'clear'
  puts "Welcome to 2048 CLI (#{VERSION})"
  puts '___________________________'
  puts 'Rules and info about game you can read here:'
  puts 'https://en.wikipedia.org/wiki/2048_(video_game)'
  puts '___________________________'
  puts 'CONTROL:'
  puts "'w-a-s-d'\tto move blocks (need to press ENTER after it)"
  puts "'Esc'\t\tto exit"
  puts '___________________________'
  puts '(Press ENTER to exit from help)'
  gets
  show_menu
end

show_menu