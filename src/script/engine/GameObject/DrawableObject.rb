import 'engine/hierarchy/layer.rb'

class DrawableObject < Layer
	attr_accessor :visible

	def initialize(x=0,y=0)
		super()

		@x = x
		@y = y

		@visible = true
	end
	def dispose
		super()
	end

	def draw(px,py)
	end
	def update
		if @visible == true
			offsetX = 0
			offsetY = 0

			if @parent != nil
				offsetX = @parent.x
				offsetY = @parent.y
			end
		
			draw(@x + offsetX, @y + offsetY)
		end

		super()
	end
end