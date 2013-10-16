class Particle < GameObject
	@@sprite = Sprite.new("orange.png", 4,4)
	@@sprite.blend = BlendMode::Add

	def initialize(x,y)
		super(x,y, @@sprite)

		@sx = 0#Math.sin(rand(40))  - 5
		@sy = 0#Math.cos(rand(40))  - 5

		@angle = rand(360)
		@step = 0
		@alpha = 1

		@lifeTime = 1000 + rand(300)
		@life = @lifeTime

		@tick = $system.ticks

		@tUpdate = Timer.new(30)
		@tUpdate.start
	end
	def dispose
		super
	end

	def draw(px, py)
		#@sprite.alpha = @alpha

		@@sprite.angle = @angle
		@@sprite.step = @step
		@@sprite.draw(@x, @y)
	end
	def update
		super()

		elapsed = $system.ticks - @tick
		@life -= elapsed
		@tick = $system.ticks

		@alpha -= 1.0 / @lifeTime * elapsed
		if @alpha < 0
			dispose
		end

		@tUpdate.on do
			@x += @sx
			@y += @sy

			@step = 16-@life / (@lifeTime / 16)	
		end
	end
end