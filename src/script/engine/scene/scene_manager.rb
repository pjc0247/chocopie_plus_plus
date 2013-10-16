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
	# ���� �����ϴ� ���� �����Ѵ�.
	# �� ���ÿ��� ������ ���� �ʴ´�.
	def change(to)
		@scene.dispose if @scene != nil

		puts "change scnee - to : #{to}"

		a = to.allocate
		@scene = a
		a.send(:initialize)
	end


	# replace
	#
	# ���� �� ������ �ֻ��� ���� �ٸ� ������ ��ü�Ѵ�.
	def replace(to)
		@stack.pop
		change to
	end

	# push
	#
	# �� ���ÿ� ���ο� ���� �߰��ϰ�
	# �ش� ���� ���� ������ �����Ѵ�
	def push(to)
		change to
		@stack.push to
	end

	# pop
	#
	# �� ���ÿ� �ֻ��� ���� �����ϰ�
	# �Ʒ� �ܰ��� ���� ���� ������ �����Ѵ�.
	# ( �� �ڷΰ��� )
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


