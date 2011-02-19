class Entry < ActiveRecord::Base
  attr_accessible :course_code, :course_name, :course_type, :group_code, 
                  :week, :week_day, :building, :room, :lecturer,
                  :start_hour, :start_min, :end_hour, :end_min
  
  belongs_to :schedule
  
  validates_presence_of :course_name
  
  def location
    [building, room].reject{|e| e.blank?}.join(" / ")
  end
end
