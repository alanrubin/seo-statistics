class WordIndex
  def initialize
    @index = Hash.new(nil)
  end
  def index(aPhrase)
    aPhrase.scan /\w[-\w']+/ do |aWord|   # extract each word
      aWord.downcase!
      @index[aWord] = 0 if @index[aWord].nil?
      @index[aWord]=@index[aWord]+1
    end
  end
  def sort
    @index.sort{|a,b| a[1] <=> b[1]}
  end
  def hash
    @index
  end
end