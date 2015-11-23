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
			puts planet[3]
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
		acceleration = find_acceleration
		(0...@planets.length).each do |n|
			@planets[n].set_vel_x(acceleration[n][0])
			@planets[n].set_vel_y(acceleration[n][1])
		end
		@planets.each do |n|
			n.update
		end
	end

	def find_forces
		forces = []
		(0...@planets.length).each do |n|
			force = [0, 0]
			x = 0
			(x...@planets.length).each do |z|
				if @planets[n] != @planets[z]
					force_s = Force.new(@planets[n].x, @planets[n].y, @planets[z].x, @planets[z].y, @planets[n].mass, @planets[z].mass)
					force[0] -= force_s.calculate_forces[0]
					force[1] -= force_s.calculate_forces[1]
				end	
			end
			x += 1
			forces.push(force)
		end
		forces
	end 

	def find_acceleration
		forces = find_forces
		acceleration = []
		(0...forces.length).each do |n|
			acceleration.push([(forces[n][0] / @planets[n].mass), (forces[n][1] / @planets[n].mass)])
		end
		acceleration
	end	

end

window = Window.new(2.50e2)
window.show