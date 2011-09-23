# encoding: utf-8

module Epure
  class ParserException < Exception
    attr_accessor :data
    def initialize(data)
      @data = data
    end
  end

  class Parser
    include Epure::Config

    def self.parse!(html)
      doc = new(html)
      doc.parse!
    end

    def initialize(html)
      @html = html
      @doc = Nokogiri::HTML(html)
    end

    def entry_time(e)
      [e.week_day, e.week, e.start_hour, e.start_min, e.end_hour, e.end_min]
    end

    def parse!
      schedule = Schedule.new

      semester = @doc.css("td.WYBRANA").map {|e| e.content.strip}
      schedule.year = semester[0]
      schedule.semester = SEMESTERS[semester[1]]

      tables = @doc.css("table.KOLOROWA")
      entries = []

      tables[2, tables.size-2].each do |table|
        trs = table.children
        trs = trs[4, trs.size-4]

        (0...(trs.size / 4)).each do |i|
          k = 4*i
          entry = Entry.new

          tds = trs[k].css("td")

          if tds.size > 2
            entry.group_code = tds[0].content.strip
            entry.course_code = tds[1].content.strip
            entry.course_name = tds[2].content.strip

            tds = trs[k+2].css("td")
            entry.lecturer = tds[0].content.strip
            type = tds[1].content.strip
            entry.course_type = COURSE_TYPES[type] || type

            es = trs[k+3].css("table tr td").map do |td|
              e = entry.dup

              where_when = td.content.strip
              m_when = nil

              if m_when = where_when.match(/\d{4}-\d{2}-\d{2} \((.+?)\) (\d{2}):(\d{2})-(\d{2}):(\d{2})/u)
                # zaoczne
                e.week_day    = WEEK_DAYS[m_when[1]]
                e.week        = WEEKS[""]
                e.start_hour  = m_when[2].to_i
                e.start_min   = m_when[3].to_i
                e.end_hour    = m_when[4].to_i
                e.end_min     = m_when[5].to_i
              elsif m_when = where_when.match(/(.{2})(?:\/(T(?:P|N)?))? (\d{2}):(\d{2})-(\d{2}):(\d{2})/u)
                e.week_day    = WEEK_DAYS[m_when[1]]
                e.week        = WEEKS[m_when[2] || ""]
                e.start_hour  = m_when[3].to_i
                e.start_min   = m_when[4].to_i
                e.end_hour    = m_when[5].to_i
                e.end_min     = m_when[6].to_i
              end

              unless m_when.nil?
                if m_where = where_when.match(/bud. (.+?), sala (.+)/u)
                  e.building = m_where[1]
                  e.room = m_where[2]
                else
                  e.building = "?"
                  e.room = "?"
                end
                e
              else
                nil
              end

            end.compact

            es.reject do |e|
              et = entry_time(e)
              e.building == "?" && e.room == "?" && es.find {|x| entry_time(x) == et }
            end.uniq do |e|
              entry_time(e)
            end.each do |e|
              entries << e
            end
          end

        end
      end

      schedule.entries += entries
      schedule
    rescue
      raise ParserException.new(@html)
    end
  end
end
