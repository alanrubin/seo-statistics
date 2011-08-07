require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "MetricsPlugins" do
  describe JavascriptInlineChars do
  
    before(:each) do
      @page = SeoStatistics::Page.new(File.new(File.dirname(__FILE__) + '/fixtures/first.html'))
    end
  
    it "should extract javascript inline char size correctly" do
      JavascriptInlineChars.new.run(@page, ['my', 'description']).should eq(130)       
    end
  end
end