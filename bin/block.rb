class Block
  attr_accessor :value, :stacked

  def initialize
    @value = 0
    @stacked = false
  end

  def zero?
    @value.zero?
  end

  def to_str
    to_s
  end

  def to_s
    @value.to_s
  end

  def []=(val)
    @value = val
  end
end