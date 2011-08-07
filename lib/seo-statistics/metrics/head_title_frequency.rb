class HeadTitleFrequency
  
  def run(page, search)
    page.content_extract('head title', :css, nil, search).first
  end
  
  def name
    "Frequency of search words in the head > title tag"
  end  
  
end