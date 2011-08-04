require 'page_rankr'

class BackLink
  def backlinks(url)
    PageRankr.backlinks(url)
  end
end