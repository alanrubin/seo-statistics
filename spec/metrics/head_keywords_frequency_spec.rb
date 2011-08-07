require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "MetricsPlugins" do
  describe HeadKeywordsFrequency do
  
    before(:each) do
      @page = SeoStatistics::Page.new(File.new(File.dirname(__FILE__) + '/../fixtures/first.html'))
    end
  
    it "should have empty frequency if search words are not found" do
      HeadKeywordsFrequency.new.run(@page, []).should have(0).entries
    end
  
    it "should have correct frequency for selected search words" do
      HeadKeywordsFrequency.new.run(@page, ['my', 'keywords']).should include('my' => 2, 'keywords' => 2)
      HeadKeywordsFrequency.new.run(@page, ['my']).should_not include('keywords')
    end
  end
end