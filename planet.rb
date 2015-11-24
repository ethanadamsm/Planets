require "gosu"
require_relative "force"

class Planet

	def initialize(x, y, vel_x, vel_y, mass, image, scale)
		@scale = scale
		@x = 250 * (x.to_f / scale) + 250
		@y = 250 * (y.to_f / scale) + 250
		@vel_x = vel_x.to_f / @scale
		@vel_y = vel_y.to_f / @scale
		puts vel_y
		@mass = mass.to_f
		@image_n = image
		@image = Gosu::Image.new("images/#{image}")
		@force_x = 0
		@force_y = 0
	end

	def draw
		@image.draw(@x, @y, 1)
	end

	def x 
		@x
	end

	def y
		@y
	end

	def vel_x
		@vel_x
	end

	def vel_y
		@vel_y
	end

	def set_vel_x(vel_x)
		@vel_x += vel_x / @scale
	end

	def set_vel_y(vel_y)
		@vel_y += vel_y / @scale
	end

	def mass
		@mass
	end

	def calculate_force(planet)
		force = Force.new(@x, @y, planet.x, planet.y, @mass, planet.mass, @scale)
		@force_x -= force.calculate_forces[0] / @scale
		@force_y -= force.calculate_forces[1] / @scale
	end	

	def update
		puts "#{@image_n} = #{@force_x / mass} and force = #{@force_x}"
		@vel_x += @force_x / @mass / 100000
		@vel_y += @force_y / @mass / 100000
		@x += vel_x
		@y += vel_y
		@force_x = 0
		@force_y = 0
	end

end