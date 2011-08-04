# Require all files inside directory metrics - where metric plugins are located
Dir[File.join(File.dirname(__FILE__), "metrics", "*.rb")].each {|file| require file }
                                                                 
module SeoStatistics
  class Metrics
    attr_accessor :found_metrics
    
    def initialize                                                    
      @found_metrics = self.class.constants.collect{|metric| symbol_for(metric)}
    end

    # def print(*metrics)
    #       metrics = found_metrics if metrics.empty?
    #       
    #       measured = {}
    #       metrics.each do |metric|
    #         name, klass = constant_name(metric), self.class
    #         
    #         next unless klass.const_defined? name
    # 
    #         measured[metric] = klass.const_get(name).new()
    #         
    #       end
    #             
    #       puts ">>> Found #{measured.inspect} <<<"
    #     end
    
    private
    
    def symbol_for(klass)
      word = klass.to_s.dup
      word.gsub!(/([A-Z]+)([A-Z][a-z])/){|match| "#{$1}_#{$2}" }
      word.gsub!(/([a-z\d])([A-Z])/){|match| "#{$1}_#{$2}" }
      word.tr!("-", "_")
      word.downcase!
      word.to_sym
    end
    
    def constant_name(sym)
      sym.to_s.split('_').collect{|str| str.capitalize}.join
    end
  end
end