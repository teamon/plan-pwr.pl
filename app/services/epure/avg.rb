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

      (table.children.size / 4).times do |index|
        da = table.children[4*index + 3].css("table.KOLOROWA")[0].css("tr")
        data << {
          :info => (0..2).map {|i| table.children[4*index + i].css("td.BIALA_LEFT")[0].content.gsub(/&nbsp;/, "").strip },
          :data => da[1, da.size-1].map {|d| d.css("td").map {|e| e.content.strip} }
        }
      end

      data
    end
  end
end
