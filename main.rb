require "gosu"
require_relative "planet"
require_relative "force"

class Window < Gosu::Window

	def initialize(w)
		w = (w.to_f)
		w = w.to_i
		super(500, 500)
		file = File.open("simulations/planets.txt").read
		array = file.split("\n")
		@scale = array[1].to_f
		array_f = []
		@planets = []
		(2...array.length).each do |n|
			array_f.push(array[n].split(" "))
		end
		array_f.each do |planet|
			@planets.push(Planet.new(planet[0], planet[1], planet[2], planet[3], planet[4], planet[5], @scale))
		end
		@background = Gosu::Image.new("images/starmap.jpg")
	end

	def draw
		@planets.each do |planet|
			planet.draw
		end
		@background.draw(0, 0, 0)
	end

	def update
		find_forces
		@planets.each do |planet|
			planet.update
		end
	end

	def find_forces
		(0...@planets.length).each do |n|
			x = 0
			(x...@planets.length).each do |z|
				if @planets[n] != @planets[z]
					@planets[n].calculate_force(@planets[z])
				end	
			end
			x += 1
		end
	end 

end

window = Window.new(2.50e2)
window.show