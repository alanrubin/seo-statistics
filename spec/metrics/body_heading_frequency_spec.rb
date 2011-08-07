require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "MetricsPlugins" do
  describe BodyHeadingFrequency do
  
    before(:each) do
      @page = SeoStatistics::Page.new(File.new(File.dirname(__FILE__) + '/../fixtures/first.html'))
    end
  
    it "should have empty frequency if search words are not found" do
      BodyHeadingFrequency.new.run(@page, []).should have(0).entries
    end
  
    it "should have correct frequency for selected search words" do
      BodyHeadingFrequency.new.run(@page, ['my', 'first', 'second', 'third']).should include('my' => 4, 'first' => 2, 'second' => 1, 'third' => 1)
      BodyHeadingFrequency.new.run(@page, ['my', 'first', 'second', 'third']).should_not include('heading')
    end
  end
end