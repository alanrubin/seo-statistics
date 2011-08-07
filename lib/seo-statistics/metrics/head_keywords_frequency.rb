class HeadKeywordsFrequency
  
  def run(page, search)
    page.attr_extract('head meta', 'keywords', 'content', search).first
  end
  
  def name
    "Frequency of search words in the head > metadata keywords tag"
  end  
  
end