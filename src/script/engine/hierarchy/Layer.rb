class Layer
	attr_reader :children
	attr_reader :z
	attr_accessor :x, :y
	attr_accessor :parent

	def initialize(z_order = 1)
		@children = Array.new
		@z = z_order

		@x = 0
		@y = 0

		@parent = nil
	end
	def dispose
		@children.each do |child|
			child.dispose
		end

		@children.clear

		if @parent != nil
			@parent.delete(self, false)
		end
	end

	def update
		$_update_call += 1

		@children.each do |child|
			child.update	
		end
	end
	def postUpdate
	end

	def add(obj, z=0)
		if obj.public_methods.member?(:parent=) == true
			obj.parent = self
		end
		@children.push obj

		sort if z != 0
	end
	def delete(obj, release=true)
		if obj.public_methods.member?(:parent=) == true
			obj.parent = nil
		end

		@children.delete obj

		obj.dispose if release == true
	end
		

	# 최적화 필요
	def sort
		@children.sort_by! do |o|
			o.z if o.methods.member?(:z)
		end
	end


	def print_info
		puts ("   " * $_tab) + self.to_s

		@children.each do |child|
			$_tab += 1

			if child.public_methods.member?(:print_info) == true
				child.print_info
			else
				puts ("   " * $_tab) + child.to_s
			end

			$_tab -= 1
		end
	end
	def show_hierarchy
		$_tab = 0

		print_info
	end
end