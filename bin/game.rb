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
    puts "Score: #{@score}"
    @field.show_field
    wait_for_turn
  end

  def wait_for_turn
    c = gets.chomp
    case c
    when 'w', 'W'
      @field.move_up
    when 's', 'S'
      @field.move_down
    when 'a', 'A'
      @field.move_left
    when 'd', 'D'
      @field.move_right
    end
    update_field
  end
end