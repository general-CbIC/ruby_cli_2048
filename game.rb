require './bin/game'

def show_menu
  system 'clear'
  puts 'Choose variant:'
  puts '1. Start game'
  puts '0. Exit'
  answer = gets.chomp
  menu if answer.to_i > 1 || answer.to_i < 0
  if answer == '1'
    game = Game.new
    game.start_game
  end
  exit if answer == '0'
end

show_menu