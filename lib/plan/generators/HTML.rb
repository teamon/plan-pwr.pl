module Plan::Generators
  class HTML
    include Plan::Config
    def template
      Rails.root + "lib/plan/generators/html-template.erb"
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

    def initialize(schedule, colors)
      @schedule = schedule
      @colors = colors
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
      cls + (entry.week != "" && all.any? {|e, (t,s)| (t >= top && t <= stop) || (t < top && t+s > top) } ? "_wider" : "")
    end
    
    def entry_time_string(entry)
      "#{entry.start_hour}:#{entry.start_min} - #{entry.end_hour}:#{entry.end_min}"
    end
  end

  class MiniHTML < HTML
    def template
      File.dirname(__FILE__) + "/../../views/pdf-template-mini.erb"
    end
  end
end
