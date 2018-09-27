require_relative 'class/simulator_tr'

simulator = SimulatorTR.new

if ARGV.length.eql?(2)
  simulator.place.create!(ARGV[0].to_i, ARGV[1].to_i)
else
  simulator.place.create!
end

puts simulator.place.to_s

begin
  simulator.place_robot
  simulator.control
rescue ArgumentError => ex
  ex.message
end
