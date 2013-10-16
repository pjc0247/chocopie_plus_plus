class Rect
	attr_accessor :x, :y, :w, :h

	def initialize(x,y,w=1,h=1)
		set(x,y,w,h)
	end
	def set(x,y,w=1,h=1)
		@x = x
		@y = y
		@w = w
		@h = h
	end
end