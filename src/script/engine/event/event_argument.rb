class EventArg
	# Common
	attr_accessor :type

	# MouseEvent
	attr_accessor :x, :y
	attr_accessor :state
	attr_accessor :button

	# Keyboard Event
	attr_accessor :key
	attr_accessor :repeated
end
