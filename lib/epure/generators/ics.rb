# encoding: utf-8

module Epure
  module Generators
    class ICS < Calendar
      def generate(zip = false)
        if zip
          cals = Hash[Epure::Config::COURSE_TYPES.map do |name, sym|
            [sym, RiCal.Calendar]
          end]

          each do |date, entry|
            start_time = format_date(cals.first.last, date, entry, :start)
            end_time = format_date(cals.first.last, date, entry, :end)
            cals[entry.course_type].add_subcomponent(RiCal.Event do
              dtstart     start_time
              dtend       end_time
              summary     entry.course_name_with_type
              description entry.description
              location    entry.location
            end)
          end

          Zippy.new do |zip|
            cals.select {|sym, cal| !cal.events.empty? }.each do |sym, cal|
              zip["Plan-#{sym}.ics"] = cal.to_s
            end
          end.data
        else
          cal = RiCal.Calendar do |c|
            each do |date, entry|
              start_time = format_date(c, date, entry, :start)
              end_time = format_date(c, date, entry, :end)
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
      end

      def format_date(calendar, date, entry, which)
        d = [date.year, "%02d" % date.month, "%02d" % date.day, "T", "%02d" % entry.send(:"#{which}_hour"), "%02d" % entry.send(:"#{which}_min"), "00"].join

        RiCal::PropertyValue::DateTime.new(calendar, :value => d, :params => {'TZID' => "Europe/Warsaw"})
      end
    end # ICal
  end # Generators
end
