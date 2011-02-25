# encoding: utf-8

module Epure
  module Generators
    class VCS < Calendar
      def generate
        cal = Vpim::Icalendar.create2
        
        each do |date, entry|
          cal.add_event do |e|
            e.dtstart     DateTime.civil(date.year, date.month, date.day, entry.start_hour, entry.start_min)
            e.dtend       DateTime.civil(date.year, date.month, date.day, entry.end_hour, entry.end_min)
            e.summary     entry.course_name_with_type
            e.description entry.description
            # e.location entry.location
          end
        end
        
        cal.encode
      end
      
      def format_date(date, which)
        DateTime.civil(date.year, date.month, date.day, entry.send(:"#{which}_hour"), entry.send(:"#{which}_min"))
      end
    end # VCS
  end # Generators
end # Epure
