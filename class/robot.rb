class Robot
  attr_accessor :x_line, :y_line, :fronts, :cur_front

  def initialize
    @x_line = nil
    @y_line = nil
    @cur_front = nil
    @fronts = %w[north east south west]
  end

  def place!(x_line, y_line, front)
    @x_line = x_line
    @y_line = y_line
    @cur_front = front
  end

  def move
    case @cur_front
    when 'north'
      move_north!
    when 'east'
      move_east!
    when 'south'
      move_south!
    when 'west'
      move_west!
    end
  end

  def right!
    index = fronts.find_index(@cur_front)
    index = index.equal?(3) ? 0 : index + 1
    @cur_front = fronts[index]
  end

  def left!
    index = fronts.find_index(@cur_front)
    index = index.equal?(0) ? 3 : index - 1
    @cur_front = fronts[index]
  end

  def report
    puts "Im here: x:#{@x_line} y:#{@y_line} and heading #{@cur_front}"
  end

  private

  def move_north!
    @y_line += 1
  end

  def move_south!
    @y_line -= 1
  end

  def move_east!
    @x_line += 1
  end

  def move_west!
    @x_line -= 1
  end
end
