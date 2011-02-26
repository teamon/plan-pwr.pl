# encoding: utf-8

module Epure
  class ParserException < Exception
  end

  class Parser
    include Epure::Config
    
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
      Rails.logger.debug("semester: " + semester.inspect)
      
      schedule.year = semester[0]
      Rails.logger.debug("s.year: " + semester[0])
      
      schedule.semester = SEMESTERS[semester[1]]
      Rails.logger.debug("s.semester: " + semester[1])
      
      tables =  @doc.css("table.KOLOROWA")
    
      entries = []
      
      tables[2, tables.size-2].each do |table|
        Rails.logger.debug("---")
        trs = table.children
        trs = trs[4, trs.size-4]
    
        (0...(trs.size / 4)).each do |i|
          Rails.logger.debug("---")
          k = 4*i
          entry = Entry.new
    
          tds = trs[k].css("td")
          
          if tds.size > 2
          
            Rails.logger.debug("tds.size: #{tds.size}")
            # Rails.logger.debug("tds: " + tds.inspect)
            entry.group_code = tds[0].content.strip
            Rails.logger.debug("entry.group_code: #{entry.group_code}")
          
            entry.course_code = tds[1].content.strip
            Rails.logger.debug("entry.course_code: #{entry.course_code}")
          
            entry.course_name = tds[2].content.strip
            Rails.logger.debug("entry.course_name: #{entry.course_name}")
    
            tds = trs[k+2].css("td")
            entry.lecturer = tds[0].content.strip
            type = tds[1].content.strip
            entry.course_type = COURSE_TYPES[type] || type
        
            trs[k+3].css("table tr td").each do |td|
              where_when = td.content.strip
            
              Rails.logger.debug("where_when: " + where_when)
            
              m_when = nil
          
              if m_when = where_when.match(/\d{4}-\d{2}-\d{2} \((.+?)\) (\d{2}):(\d{2})-(\d{2}):(\d{2})/u)
                # zaoczne
                Rails.logger.debug("Matched where_when #2")
                entry.week_day    = WEEK_DAYS[m_when[1]]
                entry.week        = WEEKS[""]
                entry.start_hour  = m_when[2].to_i
                entry.start_min   = m_when[3].to_i
                entry.end_hour    = m_when[4].to_i
                entry.end_min     = m_when[5].to_i
              elsif m_when = where_when.match(/(.{2})(?:\/(T(?:P|N)?))? (\d{2}):(\d{2})-(\d{2}):(\d{2})/u)
                Rails.logger.debug("Matched where_when #1")
                entry.week_day    = WEEK_DAYS[m_when[1]]
                entry.week        = WEEKS[m_when[2] || ""]
                entry.start_hour  = m_when[3].to_i
                entry.start_min   = m_when[4].to_i
                entry.end_hour    = m_when[5].to_i
                entry.end_min     = m_when[6].to_i
              end
            
              unless m_when.nil?
                if m_where = where_when.match(/bud. (.+?), sala (.+)/u)
                  entry.building = m_where[1]
                  entry.room = m_where[2]
                else
                  entry.building = "?"
                  entry.room = "?"
                end
              
                entries << entry
              end
            end
            
          end

        end
      end

      schedule.entries += entries
      schedule
    rescue
      raise ParserException
    end
  end
end
