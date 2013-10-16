import 'engine/hierarchy/layer.rb'

class Timer < Layer
    attr_accessor :interval, :callback

    def initialize(interval=0,block=nil)
		super()

        @interval = interval
        @start_tick = 0
        @pause = 0
        @callback = block
        @started = false


        if @callback != nil
            $scene.scene.add self
        end
    end
    def dispose
        if @callback != false
            $scene.scene.delete self
        end
    end
    
    def stop
        @started = false
    end
    def start
        @started = true
        @pause = 0
        @start_tick = $system.ticks
    end
    def pause
        @pause = $system.ticks
    end
    def paused?
        if @pause > 0
            return true
        else return false
        end
    end
    def started?
		if @started == true
			return true
		else
			return false
		end
    end
    def resume
        @start_tick += $system.ticks-@pause
        @pause = 0
    end

    def ticks
        $system.ticks-@start_tick
    end

    def done?
        # 퓨즈 중이면
        if @pause != 0 or @started == false
            return false
        end    

        if ticks >= @interval
            if @callback == nil
                start
            end
            return true
        else
            return false
        end        
    end
	def on(&block)
		if done? == true
			block.call
		end
	end
    
    def update
        # 퓨즈 중이면
        if @pause != 0 or @started == false
            return
        end

        if ticks >= @interval
            start
            #@callback.call
        end        
    end
end