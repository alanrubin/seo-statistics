class HeadDescriptionFrequency
  
  def run(page, search)
    page.attr_extract('head meta', 'description', 'content', search).first
  end
  
  def name
    "Frequency of search words in the head > metadata description tag"
  end  
  
end