import 'engine/gameobject/drawableobject.rb'

class GameObject < DrawableObject
	def initialize(x,y, sprite=nil)
		super()

		@x = x
		@y = y
		@sprite = sprite
	end
	def dispose
		super
	end

	def draw(px, py)
		@sprite.draw(px, py) if @sprite != nil
	end
	def update
		super
	end
end