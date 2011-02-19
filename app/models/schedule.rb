class Schedule < ActiveRecord::Base
  attr_accessor :raw
  attr_accessible :year, :semester
  
  has_many :entries

  def generate_hash!
    self.hash = rand(36**8).to_s(36) + id.to_s(36)
    save
  end
  
  def days
    @days ||= begin
      d = entries.group_by {|e| e.week_day }
      x = if d[5].blank? && d[6].blank?
        4
      elsif d[6].blank?
        5
      else
        6
      end
      
      (0..x).each {|i| d[i] ||= []}
      d
    end
  end
end
