$LOAD_PATH << './lib'
require 'extractor'

#puts Extractor.new('http://www.quackit.com/html/templates/simple/live-previews/abstractlight/').keywords
puts Extractor.new(File.new('./spec/fixtures/first.html')).keywords
