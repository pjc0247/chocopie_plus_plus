module EventHandler
    def event(e,arg)
        case e
			when Event::Quit
	            self.quit

			when Event::MouseMove
	            self.mouseMove(arg.x, arg.y)

			when Event::MouseDown
				case arg.button
					when MouseButton::Left
						self.leftDown(arg.x, arg.y)
					when MouseButton::Right
						self.rightDown(arg.x, arg.y)
				end
			when Event::MouseUp
	            case arg.button
					when MouseButton::Left
						self.leftUp(arg.x, arg.y)
					when MouseButton::Right
						self.rightUp(arg.x, arg.y)
				end
	        when Event::KeyDown
		        self.keyDown(arg.key, arg.repeated)
	        when Event::KeyUp
		        self.keyUp(arg.key)
        end
    end
	
	def quit
        true
    end

    def leftDown(x,y)
    end
    def leftUp(x,y)
    end
    def rightDown(x,y)
    end
    def rightUp(x,y)
    end

    def mouseMove(x,y)
    end

    def keyDown(key, repeated)
    end
    def keyUp(key)
    end
end
