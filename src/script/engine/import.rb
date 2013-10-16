$_LOADED = Hash.new

def import(_path)
	return if $_LOADED[_path.upcase] != nil
	$_LOADED[_path.upcase] = true

	begin
		if _path[_path.length-1] == '*'
			path = "script" + "/" + _path
			Dir[path[0..path.length-1] + "*.rb"].each do |file|
			
				load file
			
			end
			path = "./" + _path
			Dir[path[0..path.length-1] + "*.rb"].each do |file|
			
				load file
			
			end
		else
			load "script/" + _path
		end
		
	rescue Exception => e
		puts " [Error] An error has occured while loading #{_path}"
		puts " [Error] #{e.message}"
		e.backtrace.each do |bt|
			puts "    [backtrace] #{bt}"
		end
	end
end
