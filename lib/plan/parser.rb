# encoding: utf-8

module Plan
  class Parser
    include Plan::Config
    
    def self.parse!(html)
      doc = new(html)
      doc.parse!
    end

    def initialize(html)
      @doc = Nokogiri::HTML(html)
    end

    def parse!
      schedule = Schedule.new

      semester = @doc.css("td.WYBRANA").map {|e| e.content.strip}
      schedule.year = semester[0]
      schedule.semester = SEMESTERS[semester[1]]

      tables =  @doc.css("table.KOLOROWA")
    
      entries = tables[2, tables.size-2].map do |table|
        trs = table.children
        trs = trs[4, trs.size-4]
    
        (0...(trs.size / 4)).map do |i|
          k = 4*i
          entry = Entry.new
    
          tds = trs[k].css("td")
          entry.group_code = tds[0].content.strip
          entry.course_code = tds[1].content.strip
          entry.course_name = tds[2].content.strip
    
          tds = trs[k+2].css("td")
          entry.lecturer = tds[0].content.strip
          type = tds[1].content.strip
          entry.course_type = COURSE_TYPES[type] || type
        
          trs[k+3].css("table tr td").each do |td|
            where_when = td.content.strip
          
            if m_when = where_when.match(/(.{2})(?:\/(T(?:P|N)?))? (\d{2}):(\d{2})-(\d{2}):(\d{2})/u)
              entry.week_day = WEEK_DAYS[m_when[1]]
              entry.week = WEEKS[m_when[2] || ""]
              entry.start_hour  = m_when[3].to_i
              entry.start_min   = m_when[4].to_i
              entry.end_hour    = m_when[5].to_i
              entry.end_min     = m_when[6].to_i
    
              m_where = where_when.match(/bud. (.+?), sala (.+)/u)
              if m_where
                entry.building = m_where[1]
                entry.room = m_where[2]
              else
                entry.building = "?"
                entry.room = "?"
              end
            end
          end
          entry
        end
      end.flatten
    
      [schedule, entries]
    end
  end
end





# 
# class EntryX
# 
#                 
#   def start_time
#     @start_time ||= parse_time(time[:start])
#   end
#   
#   def end_time
#     @end_time ||= parse_time(time[:end])
#   end
#   
# 
#   
#   def location
#     "#{building} / #{room}"
#   end
#   
#   def time_string
#     "#{time[:start][:hour]}:#{time[:start][:min]} - #{time[:end][:hour]}:#{time[:end][:min]}"
#   end
#   
#   
#   def type_code
#     TYPES[type] || type
#   end
#   
#   def type_color
#     {"W" => "ecdf92", "C" => "ff4283", "L" => "b0e35d", 
#       "S" => "ffa645", "P" => "bf9bf8"}[type_code] || "FFFFFF"
#   end
#   
#   def in_week?(n)
#     week == "" || week == ["TP", "TN"][n%2]
#   end
#   
#   def course_name_with_type
#     "#{course_name} (#{type_code})"
#   end
#   
#   protected
#   
#   def parse_time(time)
#     time[:hour].to_i * 100 + time[:min].to_i
#   end
# end
