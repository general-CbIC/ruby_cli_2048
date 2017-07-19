class Field
  require './bin/block'

  def initialize(game)
    @game = game
    @field = [
      [Block.new, Block.new, Block.new, Block.new],
      [Block.new, Block.new, Block.new, Block.new],
      [Block.new, Block.new, Block.new, Block.new],
      [Block.new, Block.new, Block.new, Block.new]
    ]
    init_random
  end

  def show_field
    print " ---------------------------------------------------------------\n"
    4.times do |row|
      print "|\t"
      4.times do |col|
        print "#{@field[row][col]}\t|\t"
      end
      print "\n"
      print " ---------------------------------------------------------------\n"
    end
  end

  def move_up
    puts 'move up'
  end

  def move_down
    puts 'move down'
  end

  def move_left
    puts 'move left'
  end

  def move_right
    puts 'move right'
  end

  private

  def init_random
    add_new_block
    add_new_block
  end

  def empty_blocks
    coordinates = []
    4.times do |row|
      4.times do |col|
        coordinates.push [row, col] if @field[row][col].zero?
      end
    end
    coordinates
  end

  def random_empty_block
    blocks = empty_blocks
    blocks[rand(blocks.length)]
  end

  def add_new_block
    if empty_blocks.empty?
      game_over
    else
      row, col = random_empty_block
      @field[row][col] = rand(2).zero? ? 2 : 4
    end
  end

  def game_over
    @game.game_over
  end
end