Dir[File.join(File.dirname(__FILE__), "lib" , "**.rb")].each do |file|
  require file
end

window = Game.new
window.show
