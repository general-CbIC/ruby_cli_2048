class Game
  require './bin/field'

  def initialize
    @field = Field.new
  end

  def start_game
    @field.show_field
  end
end