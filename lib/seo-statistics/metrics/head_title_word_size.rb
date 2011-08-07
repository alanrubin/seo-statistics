class HeadTitleWordSize
  
  def run(page, search)
    page.content_extract('head title').first.inject(0) {|sum, element| sum + element.last }
  end
  
  def name
    "Words in head title, i.e., number of words in head title"
  end  
  
end