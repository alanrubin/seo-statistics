require 'page_rankr'

class Index
  def indexes(url)
    PageRankr.indexes(url)
  end
end