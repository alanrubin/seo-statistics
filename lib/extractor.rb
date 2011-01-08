require 'word_index'
require 'nokogiri'
require 'open-uri'

class Extractor
  
  IGNORE = ['script']
  
  def initialize(url)
    @parser = Nokogiri::HTML(open(url))
  end
  
  def content_extract(selector)
    words = WordIndex.new
    @parser.css(selector).each do |title|
      words.index title.content
    end
    words.hash
  end
  
  def attr_extract(selector, attr_name)
    words = WordIndex.new
    @parser.css(selector).each do |title|
      words.index title[attr_name]
    end
    words.hash
  end
  
  def title
    content_extract('head title')
  end
  
  def keywords
    attr_extract('head meta[name=Keywords]', 'content')
  end
  
  def description
    attr_extract('head meta[name=Description]', 'content')
  end
  
  def content_hash
    words = WordIndex.new
    @parser.xpath('/*').each do |tag|
      words.index tag.content unless IGNORE.include? tag.name
    end
    words
  end
  
end