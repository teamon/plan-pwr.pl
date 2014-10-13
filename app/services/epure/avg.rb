module Epure
  class Avg
    def self.parse!(html)
      doc = new(html)
      doc.parse!
    end

    def initialize(html)
      @doc = Nokogiri::HTML(html)
    end

    def parse!
      table =  @doc.css("table.KOLOROWA")[1]
      data = []

      table.css("table.KOLOROWA").size.times do |index|
        da = table.css("table.KOLOROWA")[index].css("tr")
        data << {
          :info => (0..2).map {|i| table.css("td.BIALA_LEFT")[3*index + i].content.gsub(/&nbsp;/, "").strip },
          :data => da[1, da.size-1].map {|d| d.css("td").map {|e| e.content.strip} }
        }
      end

      data
    end
  end
end
