require File.join(File.dirname(__FILE__), "helpers", "word_index")
                                                                 
module SeoStatistics
  class Helper
    def initialize(url)
      @resource = open(url)
      @parser = Nokogiri::HTML(@resource)  
    end
    
    def content_extract(selector, method=:css, exclude=[])
      words = WordIndex.new
      content = ""
      @parser.dup.send(method, selector).each do |title|
        # excluding excluded tags
        exclude.each do |out_tags|
          title.search(out_tags).remove
        end
        content << words.index(title.content)
      end
      [words.hash, content]
    end

    def attr_extract(selector, attr_selector, attr_name)
      words = WordIndex.new
      phrase = ""
        @parser.css(selector).each do |title|
        phrase << (words.index title[attr_name]) if title['name'] && title['name'].downcase == attr_selector
      end
      [words.hash, phrase]
    end  
  end
end