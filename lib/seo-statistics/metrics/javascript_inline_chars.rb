class JavascriptInlineChars
  
  def run(page, search)
    # TODO Take in consideration scripts that are not inline (with src attribute, retrieve script for size)
    # TODO Maybe do it for page statistics - how much total bytes to load
    page.parser.css('script').inject(0) do |sum, js_line|
      sum + js_line.content.size
    end
  end
  
  def name
    "Char size of javascript inline code: Number of chars in javascript code inline in page"
  end  
  
end