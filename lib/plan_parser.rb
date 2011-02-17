# 
# class Day
#   attr_accessor :id, :entries
# 
#   def initialize(id)
#     @id = id
#     @entries = []
#   end
# 
#   def <<(entry)
#     @entries << entry
#   end
# 
#   def name
#     ["Poniedziałek", "Wtorek", "środa", "Czwartek", "Piątek", "Sobota", "Niedziela"][id]
#   end
# 
#   def size
#     return 0 if @entries.empty?
# 
#     size = 1
#     prev_end_time = 0
# 
#     @entries.each do |e|
#       if e.start_time < prev_end_time
#         e.row = 1
#         size = 2
#       end
#       prev_end_time = e.end_time
#     end
#     
#     size
#   end
# 
#   def sort!
#     @entries.sort! {|a,b| a.start_time <=> b.start_time }
#   end
#   
#   def inspect
#     "<Day id=#{id.inspect} entries=#{@entries.inspect}>"
#   end
#   
#   def method_missing(method_name, *args, &block)
#     entries.send(method_name, *args, &block)
#   end
# end
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


class PlanParser
  SEMESTERS = { "Letni" => Schedule::SUMMER, "Zimowy" => Schedule::WINTER }
  COURSE_TYPES = { "Wykład" => "W", "Ćwiczenia" => "C", "Seminarium" => "S",
    "Zajęcia laboratoryjne" => "L", "Projekt" => "P", "Inne" => "X" }
  WEEKS = { "" => 0, "TN" => 1, "TP" => 2 }
  WEEK_DAYS = { "pn" => 0, "wt" => 1, "śr" => 2, "cz" => 3, "pt" => 4, "sb" => 5, "nd" => 6 }
    
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
