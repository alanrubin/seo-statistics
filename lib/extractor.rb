require 'word_index'
require 'nokogiri'
require 'open-uri'

class Extractor
  
  IGNORE = ['script']
  
  def initialize(url)
    @parser = Nokogiri::HTML(open(url))
  end
  
  def title
    title = content_extract('head title') 
    { :frequency => title.first, 
      :word_count => title.first.inject(0) {|sum, element| sum + element.last },
      :char_count => title.last.strip.size } # Normalizing title : strip blank spaces around title
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
  
  def js_size
    # TODO Take in consideration scripts that are not inline (with src attribute, retrieve script for size)
    # TODO Maybe do it for page statistics - how much total bytes to load
    @parser.css('script').inject(0) do |sum, js_line|
      sum + js_line.content.size
    end
  end
  
  def links
    content_extract('body a').first
  end
  
  def h1_tags
    content_extract('body h1').first
  end
  
  def h2_tags
    content_extract('body h2').first
  end
  
  def h3_tags
    content_extract('body h3').first
  end
  
  def all
    content_extract('/*', :xpath).first
  end
  
  private 
  
  def content_extract(selector, method=:css)
    words = WordIndex.new
    content = ""
    @parser.send(method, selector).each do |title|
      content << (words.index title.content)
    end
    [words.hash, content]
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