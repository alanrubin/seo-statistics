require 'word_index'
require 'nokogiri'
require 'open-uri'

class Extractor
  
  IGNORE = ['script']
  
  def initialize(url)
    @parser = Nokogiri::HTML(open(url))
  end
  
  def title
    content_extract('head title')
  end
  
  def keywords
    keywords = attr_extract('head meta', 'keywords', 'content') 
    { :frequency => keywords.first, 
      :word_count => keywords.first.inject(0) {|sum, element| sum + element.last },
      :char_count => keywords.last.size }
  end
  
  def description
    description = attr_extract('head meta', 'description', 'content') 
    { :frequency => description.first, 
      :word_count => description.first.inject(0) {|sum, element| sum + element.last },
      :char_count => description.last.size }
  end
  
  def links
    content_extract('body a')
  end
  
  def h1_tags
    content_extract('body h1')
  end
  
  def h2_tags
    content_extract('body h2')
  end
  
  def h3_tags
    content_extract('body h3')
  end
  
  def all
    content_extract('/*', :xpath)
  end
  
  private 
  
  def content_extract(selector, method=:css)
    words = WordIndex.new
    @parser.send(method, selector).each do |title|
      words.index title.content
    end
    words.hash
  end
  
  def attr_extract(selector, attr_selector, attr_name)
    words = WordIndex.new
    phrase = ""
    @parser.css(selector).each do |title|
      phrase << (words.index title[attr_name]) if title['name'].downcase == attr_selector
    end
    [words.hash, phrase]
  end
  
end