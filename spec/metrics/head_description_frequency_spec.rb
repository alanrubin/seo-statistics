require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "MetricsPlugins" do
  describe HeadDescriptionFrequency do
  
    before(:each) do
      @page = SeoStatistics::Page.new(File.new(File.dirname(__FILE__) + '/../fixtures/first.html'))
    end
  
    it "should have empty frequency if search words are not found" do
      HeadDescriptionFrequency.new.run(@page, []).should have(0).entries
    end
  
    it "should have correct frequency for selected search words" do
      HeadDescriptionFrequency.new.run(@page, ['my', 'description']).should include('my' => 2, 'description' => 2)
      HeadDescriptionFrequency.new.run(@page, ['description']).should_not include('my')
    end
  end
end