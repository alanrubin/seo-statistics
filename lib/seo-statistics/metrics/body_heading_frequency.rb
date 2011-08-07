class BodyHeadingFrequency
  
  def run(page, search)
    page.content_extract('body h1, body h2, body h3', :css, nil, search).first
  end
  
  def name
    "Frequency of search words in the heading h1, h2 and h3 body tags"
  end  
  
end