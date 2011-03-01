#$LOAD_PATH << File.join(File.expand_path(File.dirname(__FILE__) , '..', 'lib')

require 'extractor'

describe Extractor do
  before(:each) do
    @html = Extractor.new(File.new('./spec/fixtures/first.html'))
  end
  
  context "when extracting html content" do
    context "dealing with head title" do
      before(:each) do
        @title = @html.title
      end
      it "should extract words frequency" do
        @title[:frequency].should include('my' => 2, 'first' => 2, 'title' => 2)
      end
      it "should extract words count" do
        @title[:word_count].should eq(6)
      end
      it "should extract words char size" do
        @title[:char_count].should eq(29)
      end
    end
    context "when dealing with images" do
      before(:each) do
        @images = @html.images
      end
      it "should retrieve number of images in page" do
        @images[:count].should eq(4)
      end
      it "should retrieve images with alt attribute" do
        @images[:alt_count].should eq(3)
      end
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
    context "when dealing with meta description" do
      before(:each) do
        @description = @html.description
      end
      it "should extract words frequency" do
        @description[:frequency].should include('my' => 2, 'description' => 2)
      end
      it "should extract words count" do
        @description[:word_count].should eq(4)
      end
      it "should extract words char size" do
        @description[:char_count].should eq(30)
      end
    end
    it "should extract javascript char size" do
      @html.js_size.should eq(130);
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
    context "when dealing with page content" do
      before(:each) do
        @page = @html.page
      end
      it "should extract words frequency" do
        @page[:frequency].should include('my' => 9, 'first' => 6)
      end
      it "should not include words inside script tags" do
        @page[:frequency].should_not include('console')
      end
      it "should extract word count" do
        @page[:word_count].should eq(27)
      end
      it "should extract text count" do
        @page[:char_count][:text].should eq(227)
      end
      it "should extract byte count" do
        @page[:char_count][:byte].should eq(1358)
      end
    end
  end
end