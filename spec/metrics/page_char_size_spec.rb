require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "MetricsPlugins" do
  describe PageCharSize do
  
    before(:each) do
      @page = SeoStatistics::Page.new(File.new(File.dirname(__FILE__) + '/../fixtures/first.html'))
    end
  
    it "should have count number of chars in page" do
      PageCharSize.new.run(@page, []).should eq(226) 
    end
    
  end
end