require File.join(File.dirname(__FILE__), "helpers", "word_index")
require 'nokogiri'
                                                                 
module SeoStatistics
  class Page
    def initialize(url)
      @resource = open(url)
      @parser = Nokogiri::HTML(@resource)  
    end
    
    def content_extract(selector, method=:css, exclude_tags=nil, include_only_content=nil)
      words = WordIndex.new
      content = ""
      @parser.dup.send(method, selector).each do |title|
        
        # excluding excluded tags
        exclude_tags.each do |out_tags|
          title.search(out_tags).remove
        end unless exclude_tags.nil?
        
        content << words.index(title.content, include_only_content)
      end
      [words.hash, content]
    end

    def attr_extract(selector, attr_selector, attr_name, include_only_content=nil)
      words = WordIndex.new
      phrase = ""
        @parser.css(selector).each do |title|
        phrase << (words.index title[attr_name], include_only_content) if title['name'] && title['name'].downcase == attr_selector
      end
      [words.hash, phrase]
    end  
  end
end