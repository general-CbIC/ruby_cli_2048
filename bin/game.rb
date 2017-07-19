class Game
  require './bin/field'

  attr_accessor :score

  def initialize
    @field = Field.new(self)
    @score = 0
  end

  def start_game
    update_field
    wait_for_turn
  end

  def game_over
    puts 'Game Over'
    exit
  end

  private

  def update_field
    system 'clear'
    puts "Score: #{@score}"
    @field.show_field
    wait_for_turn
  end

  def wait_for_turn
    case gets.chomp
    when 'w', 'W' then @field.move_up
    when 's', 'S' then @field.move_down
    when 'a', 'A' then @field.move_left
    when 'd', 'D' then @field.move_right
    when ':q' then exit
    end
    update_field
  end
end