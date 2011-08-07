require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "MetricsPlugins" do
  describe SearchPageWords do
  
    before(:each) do
      @page = SeoStatistics::Page.new(File.new(File.dirname(__FILE__) + '/../fixtures/first.html'))
    end
  
    it "should have empty words frequency if search words not found" do
      SearchPageWords.new.run(@page, []).should have(0).entries
    end
    
    it "should not include words inside script tags in frequency even if defined in search words" do
      SearchPageWords.new.run(@page, ["console"]).should_not include('console')
    end
    
    it "should include words in frequency if defined in search words" do
      SearchPageWords.new.run(@page, ["my","first"]).should include('my' => 9, 'first' => 6)
      SearchPageWords.new.run(@page, ["my","first"]).should_not include('link')
    end
    
  end
end