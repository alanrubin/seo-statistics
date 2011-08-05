class HeadTitleFrequency
  
  def run(page, search_words)
    page.content_extract('head title', :css, nil, search_words).first
  end
  
  def name
    "Frequency of words in the head > title tag"
  end  
  
end