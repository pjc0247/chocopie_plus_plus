class Size
	attr_accessor :w, :h

	def initialize(w,h)
		set(w,h)
	end
	def set(w,h)
		@w = w
		@h = h
	end
end