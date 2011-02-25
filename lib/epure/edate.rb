# encoding: utf-8

module Epure
  class EDate < ::Date
    attr_accessor :wday, :cweek
    
    class << self
      attr_accessor :semesters
      
      def apply(year, month, day, wday = nil, cweek = nil)
        date = new(year, month, day)
        date.wday = wday
        date.cweek = cweek
        date
      end
    
      def register(year, semester, &block)
        ((@semesters ||= {})[year] ||= {})[semester] = Semester.new(&block)
        Rails.logger.info "Registered new semester #{semester} for year #{year}"
      end
    
      def dates_for(schedule)
        @semesters[schedule.year][schedule.semester].dates
      end
      
      def load!
        Dir[File.join(Rails.root, "lib", "epure", "semesters", "*.rb")].each {|e| require e}
      end
    end
    
    def wday
      @wday || super
    end
    
    def cweek
      @cweek || super
    end
  end
  
  class Semester
    attr_accessor :dates
    
    def initialize(&block)
      @dates = []
      instance_eval(&block)
    end
    
    def D(*args)
      EDate.apply(*args)
    end
    
    def add(date)
      case date
      when EDate
        @dates << date
      when Range
        @dates += date.to_a
      when Array
        @dates += date
      end
    end
  end
end

