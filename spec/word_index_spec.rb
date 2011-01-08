$LOAD_PATH << File.expand_path(File.dirname(__FILE__) + '/../lib')

require 'word_index'

describe WordIndex do
  context "when initialized" do
    it "is empty" do
      WordIndex.new.hash.should be_empty
    end
  end
  context "when indexing phrase" do
    it "should index no matter case" do
      words = WordIndex.new
      words.index('Alan Rubin')
      words.index('ALAN RUBIN')
      words.hash.size.should eq 2
      words.hash['alan'].should eq 2
      words.hash['rubin'].should eq 2
    end
  end
end