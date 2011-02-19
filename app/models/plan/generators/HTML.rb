module Plan::Generators
  class HTML
    include Plan::Config
    def template
      Rails.root + "app/models/plan/generators/html-template.erb"
    end

    HOURS = (7..21).to_a
    DEFAULT_COLORS = {
      "c_W" => %w(#f3b6b7 #e63021 #e63021),
      "c_C" => %w(#aeed91 #47ae03 #47ae03),
      "c_L" => %w(#a5c4f7 #1c64dc #1c64dc),
      "c_P" => %w(#efbcf0 #bb3abd #bb3abd),
      "c_S" => %w(#f5dcc0 #f38e00 #f38e00),
      "c_X" => %w(#ccc1ec #5c3ab2 #5c3ab2)     
    }

    def self.generate!(schedule, colors = nil)
      new(schedule, colors || DEFAULT_COLORS).to_html
    end

    def initialize(schedule, colors = DEFAULT_COLORS)
      @schedule = schedule
      @colors = colors
    end
    
    def hours
      HOURS
    end
    
    def days
      @days ||= @schedule.days.map do |day_id, ent|
        entries = ent.map do |e|
          [e, entry_top_and_size(e)]
        end
        
        entries = entries.map do |e, (top, size)|
          cls =  entry_week_wider_class(e, top, size, entries)
          time = "#{e.start_hour}:#{e.start_min} - #{e.end_hour}:#{e.end_min}"
          time << " | #{WEEKS_NAMES[e.week]}" if e.week != 0
          
          [e, top, size, cls, time]
        end

        [WEEK_DAYS_NAMES[day_id], entries]
      end
    end

    def colors_css
      @colors.map do |cls, c|
        ".#{cls} {
          background-color: #{c[0]};
          border-color: #{c[1]};
          color: #{c[2]};
        }"
      end.join "\n"
    end

    def to_html
      @days = @schedule.days
      @hours_count = HOURS.size
      ERB.new(File.read(template)).result(binding)
    end
    
    def course_types
      COURSE_TYPES
    end

    protected

    def entry_top_and_size(entry)
      top = (((entry.start_hour - HOURS.first) * 60) + entry.start_min) / 5
      size = (((entry.end_hour * 60) + entry.end_min) - ((entry.start_hour * 60) + entry.start_min)) / 5

      [top, size]
    end

    def entry_week_wider_class(entry, top, size, all)
      return if entry.week == 0
      
      cls = "w_#{entry.week}"
      
      stop = top+size
      cls + (all.select {|e, (t,s)| (t >= top && t <= stop) || (t+s >= top && t+s <= stop) }.size > 1 ? "" : "_wider")
    end
    
  end

  # class MiniHTML < HTML
  #   def template
  #     File.dirname(__FILE__) + "/../../views/pdf-template-mini.erb"
  #   end
  # end
end
