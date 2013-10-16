class Color
	attr_accessor :r, :g, :b, :a

	def initialize(r,g,b,a=255)
		set(r,g,b,a)
	end
	def set(r,g,b,a=255)
		@r = r
		@g = g
		@b = b
		@a = a
	end
end