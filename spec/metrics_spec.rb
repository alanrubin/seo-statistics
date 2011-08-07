require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "SeoStatistics" do
  describe "Metrics" do
    it "should discover newly registered metrics" do
      
      # Register one test metric
      module SeoStatistics
        class Metrics
          class Test

          end
        end          
      end
      
      # Register two test metric
      module SeoStatistics
        class Metrics
          class TestComplexName

          end
        end          
      end 
      
      SeoStatistics::Metrics.new.found_metrics.should include(:test, :test_complex_name)
       
    end
    
    it "should convert constants to symbols" do
      SeoStatistics::Metrics.new.instance_eval { symbol_for("TestSomeClass") }.should eq(:test_some_class)
    end
    
    it "should convert symbols to constants" do
        SeoStatistics::Metrics.new.instance_eval { constant_name(:test_some_class) }.should eq("TestSomeClass")
    end
  end
end
