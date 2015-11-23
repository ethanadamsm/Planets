class Force

	def initialize(x1, y1, x2, y2, mass1, mass2)
		@x1 = x1
		@y1 = y1 
		@x2 = x2
		@y2 = y2
		@mass1 = mass1
		@mass2 = mass2
	end

	def calculate_forces
		[force_x, force_y]
	end

	def calculate_force
		r = (((@x2 - @x1)**2) + ((@y2 - @y1)**2))
		force_f = ((1/6.67408e11) * ((@mass1) * (@mass2))) / r
		force_f
	end

	def force_x
		if @x2 == @x1
			return calculate_force
		end
		theta = Math.atan((@y2 - @y1)/(@x2 - @x1))
		forcex = calculate_force * Math.cos(theta)
		((calculate_force * (@x2 - @x1)) / ((@x2 - @x1)**2 + (@y2 - @y2)**2)).to_f
	end

	def force_y
		if @y2 == @y1
			return calculate_force
		end
		theta = Math.atan((@y2 - @y1)/(@x2 - @y2))
		forcex = calculate_force * Math.sin(theta)
	end

end