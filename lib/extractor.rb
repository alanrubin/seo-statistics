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
    keywords = attr_extract('head meta[name=Keywords]', 'content') 
    { :frequency => keywords.first, 
      :word_count => keywords.first.inject(0) {|sum, element| sum + element.last },
      :char_count => keywords.last.size }
  end
  
  def description
    attr_extract('head meta[name=Description]', 'content').first
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
  
  def attr_extract(selector, attr_name)
    words = WordIndex.new
    phrase = ""
    @parser.css(selector).each do |title|
      phrase << (words.index title[attr_name])
    end
    [words.hash, phrase]
  end
  
end