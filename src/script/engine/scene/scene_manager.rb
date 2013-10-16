class SceneManager
	def initialize
		@scene = nil
		@stack = Array.new
	end
	def dispose
		@scene.dispose
		@stack.clear
	end

	def update
		@scene.update
	end

	def event(e,arg)
		@scene.event(e,arg)
	end

	def scene
		@scene
	end

	# change
	#
	# 현재 동작하는 씬을 변경한다.
	# 씬 스택에는 영향을 주지 않는다.
	def change(to)
		@scene.dispose if @scene != nil

		puts "change scnee - to : #{to}"

		a = to.allocate
		@scene = a
		a.send(:initialize)
	end


	# replace
	#
	# 현재 씬 스택의 최상위 씬을 다른 씬으로 교체한다.
	def replace(to)
		@stack.pop
		change to
	end

	# push
	#
	# 씬 스택에 새로운 씬을 추가하고
	# 해당 씬을 동작 씬으로 설정한다
	def push(to)
		change to
		@stack.push to
	end

	# pop
	#
	# 씬 스택에 최상위 씬을 제거하고
	# 아랫 단계의 씬을 동작 씬으로 설정한다.
	# ( 씬 뒤로가기 )
	def pop
		@stack.pop

		change @stack.last
	end

	def print_info
		puts "   " * $_tab + self.to_s

		$_tab += 1
		@scene.print_info
		$_tab -= 1
	end
end


