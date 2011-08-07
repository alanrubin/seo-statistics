class SearchPageWords
  
  IGNORE = ['script']
  
  def run(page, search)
    page.content_extract('html', :css, IGNORE, search).first
  end
  
  def name                                                                        
    # (can be divided by number of words in page for normalization)
    "Search occurrence in page: Number of occurrence of search words in whole page"
  end  
  
end