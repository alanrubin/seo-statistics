require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "SeoStatistics" do
  describe "Page" do
    
    before(:each) do
      @page = SeoStatistics::Page.new(File.new(File.dirname(__FILE__) + '/fixtures/first.html'))
    end
    
    it "should retrieve page words size" do
      @page.words_size.should eq(27)
    end
    
    it "should retrieve page char count in size and bytes" do
      size = @page.chars_size
      size[:size].should eq(226)
      size[:byte].should eq(1358)
    end
                           
  end
end
