class Field
  def initialize
    @field = [
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0],
      [0, 0, 0, 0]
    ]
    init_random
  end

  def show_field
    print " _______________________________\n"
    4.times do |row|
      print "|\t"
      4.times do |col|
        print "#{@field[row][col]}\t|\t"
      end
      print "\n"
      print " -------------------------------\n"
    end
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
      block = random_empty_block
      @field[block[0]][block[1]] = rand(2).zero? ? 2 : 4
    end
  end

  def game_over
    # game over
  end
end