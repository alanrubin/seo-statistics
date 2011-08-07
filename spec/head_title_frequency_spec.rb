require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "MetricsPlugins" do
  describe HeadTitleFrequency do
  
    before(:each) do
      @page = SeoStatistics::Page.new(File.new(File.dirname(__FILE__) + '/fixtures/first.html'))
    end
  
    it "should have empty frequency if search words are not found" do
      HeadTitleFrequency.new.run(@page, []).should have(0).entries
    end
  
    it "should have correct frequency for selected search words" do
      HeadTitleFrequency.new.run(@page, ['my', 'first']).should include('my' => 2, 'first' => 2)
      HeadTitleFrequency.new.run(@page, ['my', 'first']).should_not include('title')
    end
  end
end