$LOAD_PATH << File.expand_path(File.dirname(__FILE__) + '/../lib')

require 'extractor'

describe Extractor do
  context "when extracting html content" do
    it "it should extract title correctly" do
      Extractor.new(File.new('./spec/fixtures/title.html')).title_hash.should include('my' => 2, 'first' => 2, 'title' => 2)
    end
  end
end