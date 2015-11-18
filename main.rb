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
		scale = array[1].to_f
		array_f = []
		@planets = []
		(2...array.length).each do |n|
			array_f.push(array[n].split(" "))
		end
		array_f.each do |planet|
			@planets.push(Planet.new(planet[0], planet[1], planet[2], planet[3], planet[4], planet[5], scale))
		end
		@background = Gosu::Image.new("images/starmap.jpg")
		force = Force.new(@planets[0].x, @planets[0].y, @planets[1].x, @planets[1].y, @planets[0].mass, @planets[1].mass)
		puts force.calculate_forces
	end

	def draw
		@planets.each do |planet|
			planet.draw
		end
		@background.draw(0, 0, 0)
	end

	def find_forces(planets)
		planets.each do |planet1|
			force = [0, 0]
			planets.each do |planet2|
				force = Force.new(planet1.x, planet1.y)
			end
		end
	end 

end

window = Window.new(2.50e2)
window.show