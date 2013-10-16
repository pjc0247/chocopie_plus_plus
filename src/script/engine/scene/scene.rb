import 'engine/gameobject/DrawableObject.rb'

class Scene < DrawableObject
	include EventHandler

	def initialize
		super(0,0)
	end

	def dispose
		super()
	end

	def draw(x,y)
		super(x,y)
	end
	def update
		super()
	end
end