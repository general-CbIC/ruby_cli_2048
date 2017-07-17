class Game
  require './bin/field'

  def initialize
    @field = Field.new
  end

  def start_game
    puts 'Start game'
  end
end