# encoding: utf-8

module Epure
  module Generators
    class Calendar < Generator
      def each
        Epure::EDate.dates_for(@schedule).each do |date|
          if entries = @schedule.days[(date.wday-1) % 7]
            entries.select {|e| e.in_week?(date.cweek) }.each do |entry|
              yield(date, entry)
            end
          end
        end
      end
    end # Calendar
  end # Generators
end # Epure
