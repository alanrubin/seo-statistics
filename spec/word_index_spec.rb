require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe WordIndex do
  context "when initialized" do
    it "is empty" do
      WordIndex.new.hash.should be_empty
    end
  end
  context "when indexing phrase" do
    it "should count the same no matter word case" do
      words = WordIndex.new
      words.index('Alan Rubin')
      words.index('ALAN RUBIN')
      words.hash.size.should eq 2
      words.hash['alan'].should eq 2
      words.hash['rubin'].should eq 2
    end
    it "should count only selected tags" do
      words = WordIndex.new
      words.index('Alan Rubin', ['alan'])
      words.index('ALAN RUBIN', ['alan'])
      words.hash.size.should eq 1
      words.hash['alan'].should eq 2
      words.hash['rubin'].should be_nil
    end
  end
end