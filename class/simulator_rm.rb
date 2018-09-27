require_relative '../class/place'
require_relative '../class/robot'

class SimulatorTR
  attr_accessor :place, :robot
  RGXP = /(PLACE)\s(\d+).(\d+).(NORTH|EAST|SOUTH|WEST)/i

  def initialize
    @place = Place.new
    @robot = Robot.new
  end

  def place_robot
    form = ''

    loop do
      print '>> '
      form = STDIN.gets.chomp.to_s
      break if form.match?(RGXP)

      puts 'Error type. Example: "PLACE 0,0,NORTH"'
    end
    result = form.match(RGXP).captures

    mount(result)
  end

  def control
    loop do
      print '>> '
      form = STDIN.gets.chomp.to_s
      form.downcase!

      case form
      when 'move'
        @robot.move if move?
      when 'left'
        @robot.left!
      when 'right'
        @robot.right!
      when 'report'
        @robot.report
      when 'exit'
        break
      else
        puts 'Error type. Available: MOVE, LEFT, RIGHT, REPORT, EXIT'
      end
    end
  end

  private

  def mount(array)
    if (0...@place.x_length).cover?(array[1].to_i) && (0...@place.y_width).cover?(array[2].to_i)
      @robot.place!(array[1].to_i, array[2].to_i, array[3])
    else
      raise 'you robot crushed'
    end
  end

  def move?
    return false if @robot.cur_front.eql?('north') && @robot.y_line.eql?(@place.y_width - 1)
    return false if @robot.cur_front.eql?('east') && @robot.x_line.eql?(@place.x_length - 1)
    return false if @robot.cur_front.eql?('south') && @robot.y_line.eql?(0)
    return false if @robot.cur_front.eql?('west') && @robot.x_line.eql?(0)

    true
  end

end