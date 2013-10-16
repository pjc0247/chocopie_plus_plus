# initialize chocopie++

$LOAD_PATH << "script/lib"
$LOAD_PATH << "script/lib/i386-mingw32"

import 'engine/graphic/*'

begin
	# create renderer
	$window = Window.new( Application::Title, 
			Application::Size.w, Application::Size.h,
			Application::WindowFlags )	
	$window.active

	# create renderer
	$renderer = Renderer.new( GraphicDriver::Auto , 0 )
	$renderer.active

	$graphic = $renderer
rescue
	puts "#{$!}"
end

import 'engine/core/*'
import 'engine/hierarchy/*'
import 'engine/window/*'
import 'engine/data/*'
import 'engine/input/*'
import 'engine/event/*'
import 'engine/gameObject/*'
import 'engine/scene/*'
import 'engine/util/*'
import 'engine/extension/*'

import 'engine/particle/*'

begin
	$system = System.new

	# initialize input modules
	$mouse = Mouse.new
	$keybd = Keyboard.new

	$scene = SceneManager.new

	$lang = Lang.new



	$_update_call = 0
rescue
	puts "#{$!}"
end
