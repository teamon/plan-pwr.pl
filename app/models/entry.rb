class Entry < ActiveRecord::Base
  attr_accessible :course_code, :course_name, :group_name, :course_type, 
                  :week, :week_day, :building, :room, :lecturer,
                  :start_hour, :start_min, :end_hour, :end_min
                  
  
  belongs_to :schedule
end
