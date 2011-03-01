#$LOAD_PATH << File.join(File.expand_path(File.dirname(__FILE__) , '..', 'lib')

require 'universe_frequency'

describe UniverseFrequency do
  context "when extracting universe frequency" do
    before(:each) do
      module Kernel
        def open(*args)
          File.new('./spec/fixtures/lazy_fox.html')
        end
      end
    end
    it "should extract it as a number" do
      UniverseFrequency.new.google('lazy fox').should eq(7_980_000)
    end
  end
end