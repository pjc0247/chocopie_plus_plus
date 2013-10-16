class Point
	attr_accessor :x, :y

	def initialize(x,y)
		set(x,y)
	end
	def set(x,y)
		@x = x
		@y = y
	end

	def +(p)
		Point.new(@x + p.x, @y + p.y)
	end
	def -(p)
		Point.new(@x - p.x, @y - p.y)
	end
end