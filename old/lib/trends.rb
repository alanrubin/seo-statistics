$LOAD_PATH << File.join(File.expand_path(File.dirname(__FILE__)))

require 'nokogiri'
require 'open-uri'
require 'extractor'
require 'index'
require 'rank'
require 'word_index'
require 'back_link'

class Trends
  def initialize(query)
    @parser = Nokogiri::HTML(open("http://www.google.com/search?q=#{query.split.join('+')}"))
    puts "> Initializing google querying for '#{query}'"
    @results = {}
  end
  
  def process_results!
    @parser.css('li:not(#productbox) a.l').each_with_index do |link, i|
      puts ">> #{i}: Found '#{link.content}' --> URL: #{link['href']}"
      cur = (@results[link['href']] = [])
      ex = Extractor.new(link['href'])
      cur << ex.title
      cur << ex.images
      cur << ex.keywords
      cur << ex.description
      cur << ex.js_size
      cur << ex.links
      cur << ex.h1_tags
      cur << ex.h2_tags
      cur << ex.h3_tags
      cur << ex.page
      #puts "++ Results #{cur.inspect}"
    end
  end
  
  def results
    @results
  end
end

tr = Trends.new('flower girl dresses')
tr.process_results!

puts ">>> FINAL"
puts "#{tr.results.inspect}"
