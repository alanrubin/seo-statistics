$LOAD_PATH << './lib'
require 'extractor'

puts Extractor.new('http://www.quackit.com/html/templates/simple/live-previews/abstractlight/').title_hash
