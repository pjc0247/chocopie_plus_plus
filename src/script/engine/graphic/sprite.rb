class Sprite < Image
	attr_accessor :wSlice, :hSlice
	attr_accessor :angle

	def self.new(path, wSlice=1, hSlice=1)
		obj = super(path)
		obj.send(:initialize , path,wSlice,hSlice)
		return obj
	end

	def initialize(path, wSlice=-1, hSlice=-1)
		if wSlice == -1
			super(path)
		else
			@wSlice = wSlice
			@hSlice = hSlice

			@angle = 0
			@step = 0
			@origin = Point.new(w/2, h/2)
		end
	end

	def w
		super / @wSlice
	end
	def h
		super / @hSlice
	end

	def step
		@step
	end
	def step=(s)
		if s > @wSlice*@hSlice
			s = @wSlice*@hSlice-1
		end
		@step = s
	end
	
	def draw(x,y)
		src = Rect.new((@step % @wSlice) * w,(@step / @wSlice) * h,w,h)
		dst = Rect.new(x,y,w,h)

		drawEx(
			src, dst,
			@angle, @origin, 0)
	end
	def stretch(x,y, _w,_h)
		src = Rect.new((@step % @wSlice) * w,(@step / @wSlice) * h,w,h)
		dst = Rect.new(x,y, _w,_h)
		origin = Point.new(	@origin.x * (_w.to_f/w), @origin.y * (_h.to_f/h))

		drawEx(
			src, dst,
			@angle, @origin, 0)
	end
end