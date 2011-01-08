require 'word_index'
require 'nokogiri'
require 'open-uri'

class Extractor
  
  IGNORE = ['script']
  
  def initialize(url)
    @parser = Nokogiri::HTML(open(url))
  end
  
  def title_hash
    words = WordIndex.new
    @parser.css('head title').each do |title|
      words.index title.content
    end
    words.hash
  end
  
  def content_hash
    words = WordIndex.new
    @parser.xpath('/*').each do |tag|
      words.index tag.content unless IGNORE.include? tag.name
    end
    words
  end
  
end