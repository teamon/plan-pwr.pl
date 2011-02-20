module Epure
  module Generators
    class Generator
      include Epure::Config
      
      def initialize(schedule = nil)
        @schedule = schedule
      end
    end
  end
end
