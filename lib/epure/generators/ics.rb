# encoding: utf-8

module Epure
  module Generators
    class ICS < Calendar
      def generate
        cal = RiCal.Calendar do |c|
          each do |date, entry|
            start_time = format_date(date, entry, :start)
            end_time = format_date(date, entry, :end)
            c.event do
              dtstart     start_time
              dtend       end_time
              summary     entry.course_name_with_type
              description entry.description
              location    entry.location
            end
          end
        end
        
        cal.to_s
      end
      
      def format_date(date, entry, which)
        [date.year, "%02d" % date.month, "%02d" % date.day, "T", "%02d" % entry.send(:"#{which}_hour"), "%02d" % entry.send(:"#{which}_min"), "00"].join
      end
    end # ICal
  end # Generators
end
