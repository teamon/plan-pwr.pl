# encoding: utf-8

class Entry < ActiveRecord::Base
  attr_accessible :course_code, :course_name, :course_type, :group_code, 
                  :week, :week_day, :building, :room, :lecturer,
                  :start_hour, :start_min, :end_hour, :end_min
  
  belongs_to :schedule
  
  validates_presence_of :course_name, :message => "Podaj nazwe kursu"
  validates_inclusion_of :week, :in => [0,1,2]
  validates_inclusion_of :week_day, :in => (0..6)
  validate :correct_time
  
  def location
    [building, room].reject{|e| e.blank?}.join(" / ")
  end
  
  protected
  
  def correct_time
    if start_hour > end_hour || (start_hour == end_hour && start_min >= end_min)
      errors.add(:start_hour, "Podane godziny są niepoprawne")
    end
  end
  
end
