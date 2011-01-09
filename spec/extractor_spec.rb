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
    it "it should extract h1 tags correctly" do
      Extractor.new(File.new('./spec/fixtures/first.html')).h1_tags.should include('my' => 2, 'first' => 2, 'heading' => 2)
    end
    it "it should extract h2 tags correctly" do
      Extractor.new(File.new('./spec/fixtures/first.html')).h2_tags.should include('my' => 1, 'second' => 1, 'heading' => 1)
    end
    it "it should extract h3 tags correctly" do
      Extractor.new(File.new('./spec/fixtures/first.html')).h3_tags.should include('my' => 1, 'third' => 1, 'heading' => 1)
    end
    it "it should extract links content correctly" do
      Extractor.new(File.new('./spec/fixtures/first.html')).links.should include('my' => 2, 'first' => 1, 'second' => 1, 'link' => 2)
    end
    it "should extract all content correctly" do
      Extractor.new(File.new('./spec/fixtures/first.html')).all.should include('my' => 9, 'first' => 6)
    end
  end
end