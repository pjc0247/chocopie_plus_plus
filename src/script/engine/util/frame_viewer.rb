﻿# encoding : utf-8

import 'engine/gameobject/drawableobject.rb'

class StatusViewer < DrawableObject
	def initialize(x=0,y=0)
		super(x,y)

		@tick = 0
		@fps

		@font = Font.new("c:\\windows\\fonts\\gulim.ttc", 20);
		@font.color = Color.new(255,255,255)

		
		@font.style = FontStyle::Bold | FontStyle::Underline
		@b = @font.render($lang.get(:hello))
	end
	def dispose
		super()
	end

	def draw(x,y)
#		puts @fps
		
		@font.draw(0,100, "objects " + $_update_call.to_s)
		$_update_call = 0
	end
	def update
		super()

		elapsed = $system.ticks - @tick
		@fps = 1000.0 / elapsed

		@tick = $system.ticks
	end
end