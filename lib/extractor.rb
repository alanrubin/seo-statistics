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
    attr_extract('head meta[name=Keywords]', 'content')
  end
  
  def description
    attr_extract('head meta[name=Description]', 'content')
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
    content_extract('/*')
  end
  
  private 
  
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
  
end