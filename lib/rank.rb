require 'page_rankr'

class Rank
  def ranks(url)
    PageRankr.ranks(url)
  end
end