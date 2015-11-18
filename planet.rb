require "gosu"

class Planet

	def initialize(x, y, vel_x, vel_y, mass, image, scale)
		@x = 250 * (x.to_f / scale) + 250
		@y = 250 * (y.to_f / scale) + 250
		@vel_x = vel_x.to_f
		@vel_y = vel_y.to_f
		@mass = mass.to_f
		@image = Gosu::Image.new("images/#{image}")
		puts @x
		puts @y
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

	def mass
		@mass
	end

end