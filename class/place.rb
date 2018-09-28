class Place
  attr_accessor :x_length, :y_width

  def initialize
    @x_length = nil
    @y_width = nil
  end

  def create!(x_length = 5, y_width = 6)
    @x_length = x_length
    @y_width = y_width
  end

  def to_s
    "place size: #{@x_length}x#{@y_width}"
  end
end
