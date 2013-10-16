# entrance

import 'scene/scene1.rb'

class Application < Layer
	include EventHandler

	def initialize
		super(0)

		$scene.push MainScene
		
		add $mouse
		add $keybd
		add $scene
		add StatusViewer.new

		#show_hierarchy
	end
	def dispose
		super()
	end

	def draw(px,py)
		
	end
	def update
		super()
		$renderer.render
	end

	def mouseMove(x,y)
		#puts x,y
	end
	def leftDown(x,y)
		#puts x,y
	end

	def keyDown(key, repeated)
		#puts "#{key} , #{repeated}"
	end
end
