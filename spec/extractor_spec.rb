#$LOAD_PATH << File.join(File.expand_path(File.dirname(__FILE__) , '..', 'lib')

require 'extractor'

describe Extractor do
  before(:each) do
    @html = Extractor.new(File.new('./spec/fixtures/first.html'))
  end
  
  context "when extracting html content" do
    it "should extract title correctly" do
      @html.title.should include('my' => 2, 'first' => 2, 'title' => 2)
    end
    context "when dealing with meta keywords" do
      before(:each) do
        @keywords = @html.keywords
      end
      it "should extract words frequency" do
        @keywords[:frequency].should include('my' => 2, 'keywords' => 2)
      end
      it "should extract words count" do
        @keywords[:word_count].should eq(4)
      end
      it "should extract words char size" do
        @keywords[:char_count].should eq(24)
      end
    end
    it "should extract meta description tag correctly" do
      @html.description.should include('my' => 2, 'description' => 2)
    end
    it "should extract h1 tags correctly" do
      @html.h1_tags.should include('my' => 2, 'first' => 2, 'heading' => 2)
    end
    it "should extract h2 tags correctly" do
      @html.h2_tags.should include('my' => 1, 'second' => 1, 'heading' => 1)
    end
    it "should extract h3 tags correctly" do
      @html.h3_tags.should include('my' => 1, 'third' => 1, 'heading' => 1)
    end
    it "should extract links content correctly" do
      @html.links.should include('my' => 2, 'first' => 1, 'second' => 1, 'link' => 2)
    end
    it "should extract all content correctly" do
      @html.all.should include('my' => 9, 'first' => 6)
    end
  end
end