require 'nokogiri'
require 'open-uri'

class UniverseFrequency
  
  def google(term)
      Nokogiri::HTML(open("http://www.google.com/search?rls=en&q=#{url_encode(term)}&ie=UTF-8&oe=UTF-8")).css('#resultStats').first.child.content.gsub(/\D/,'').to_i
  end
  
  private
  
  def url_encode string
    string.to_s.gsub(/([^ a-zA-Z0-9_.-]+)/n) {
      '%' + $1.unpack('H2' * $1.size).join('%').upcase
      }.tr(' ', '+')
  end
  
end