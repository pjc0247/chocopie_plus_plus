import 'engine/gameobject/gameobject.rb'

class AnimatedObject < GameObject
	def initialize(x,y,sprite, interval=30)
		super(x,y,sprite)

		@animation_interval = interval
		@tAnimate = Timer.new(@animation_interval)
		@tAnimate.start
	end

	def update
		super

		@tAnimate.on do
		#	@sprite.doStep if @sprite != nil
		end
	end
end