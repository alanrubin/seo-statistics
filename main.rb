$LOAD_PATH << File.join(File.expand_path(File.dirname(__FILE__) , 'lib')

require 'extractor'

#puts Extractor.new('http://www.quackit.com/html/templates/simple/live-previews/abstractlight/').keywords
puts Extractor.new(File.new('./spec/fixtures/first.html')).keywords
