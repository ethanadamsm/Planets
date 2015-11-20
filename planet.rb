require "gosu"

class Planet

	def initialize(x, y, vel_x, vel_y, mass, image, scale)
		@scale = scale
		@x = 250 * (x.to_f / scale) + 250
		@y = 250 * (y.to_f / scale) + 250
		@vel_x = vel_x.to_f / 10000
		@vel_y = vel_y.to_f / 10000
		@mass = mass.to_f
		@image = Gosu::Image.new("images/#{image}")
		puts @vel_x
		puts @vel_y
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
		@vel_x += vel_x
	end

	def set_vel_y(vel_y)
		@vel_y += vel_y
	end

	def mass
		@mass
	end

	def update
		@x += @vel_x / @scale / 10
		puts @vel_x / @scale / 10
		@y += @vel_y / @scale / 10
	end

end