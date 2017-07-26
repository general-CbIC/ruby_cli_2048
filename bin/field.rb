class Field
  require './bin/block'

  attr_reader :field
  attr_accessor :changed

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

  def add_block
    add_new_block
  end

  def move_up
    4.times do |row|
      4.times do |col|
        block = @field[row][col]
        next if block.zero?
        move_block_up(row, col)
      end
    end
  end

  def move_down
    4.times do |row|
      4.times do |col|
        row = 3 - row
        block = @field[row][col]
        next if block.zero?
        move_block_down(row, col)
      end
    end
  end

  def move_left
    4.times do |row|
      4.times do |col|
        block = @field[row][col]
        next if block.zero?
        move_block_left(row, col)
      end
    end
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

  def move_block_up(i, j)
    return if i.zero?
    return if !@field[i - 1][j].zero? && @field[i - 1][j] != @field[i][j]
    @changed = true
    if @field[i - 1][j].zero?
      @field[i - 1][j] = @field[i][j]
    else
      @field[i - 1][j] *= 2
      @game.score += @field[i - 1][j]
    end
    @field[i][j] = 0
    move_block_up(i - 1, j)
  end

  def move_block_down(i, j)
    return if i == 3
    return if !@field[i + 1][j].zero? && @field[i + 1][j] != @field[i][j]
    @changed = true
    if @field[i + 1][j].zero?
      @field[i + 1][j] = @field[i][j]
    else
      @field[i + 1][j] *= 2
      @game.score += @field[i + 1][j]
    end
    @field[i][j] = 0
    move_block_down(i + 1, j)
  end

  def move_block_left(i, j)
    return if j.zero?
    return if !@field[i][j - 1].zero? && @field[i][j - 1] != @field[i][j]
    @changed = true
    if @field[i][j - 1].zero?
      @field[i][j - 1] = @field[i][j]
    else
      @field[i][j - 1] *= 2
      @game.score += @field[i][j - 1]
    end
    @field[i][j] = 0
    move_block_left(i, j - 1)
  end

  def game_over
    @game.game_over
  end
end