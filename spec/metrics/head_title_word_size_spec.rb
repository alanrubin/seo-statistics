require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "MetricsPlugins" do
  describe HeadTitleWordSize do
  
    before(:each) do
      @page = SeoStatistics::Page.new(File.new(File.dirname(__FILE__) + '/../fixtures/first.html'))
    end
  
    it "should have correct word size" do
      HeadTitleWordSize.new.run(@page, []).should eq(6)
    end        
  end
end