$LOAD_PATH << File.expand_path(File.dirname(__FILE__) + '/../lib')

require 'extractor'

describe Extractor do
  context "when extracting html content" do
    it "it should extract title correctly" do
      Extractor.new(File.new('./spec/fixtures/first.html')).title.should include('my' => 2, 'first' => 2, 'title' => 2)
    end
    it "it should extract meta keywords tag correctly" do
      Extractor.new(File.new('./spec/fixtures/first.html')).keywords.should include('my' => 2, 'keywords' => 2)
    end
    it "it should extract meta description tag correctly" do
      Extractor.new(File.new('./spec/fixtures/first.html')).description.should include('my' => 2, 'description' => 2)
    end
  end
end