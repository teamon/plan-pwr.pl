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
  
  after_update :invalidate_cache
  
  def location
    [building, room].reject{|e| e.blank?}.join(" / ")
  end
  
  def week_name
    Epure::Config::WEEKS_NAMES[week]
  end
  
  def course_name_with_type
    "#{course_name} (#{course_type})"
  end
  
  def description
    [lecturer, course_code].reject{|e| e.blank?}.join("\n")
  end
  
  def in_week?(n)
    week == 0 || (n - week) % 2 == 0
  end
  
  protected
  
  def self.search(term, key)
    query = term.split(//).reject{|e| e == " "}.join("%")
    select("DISTINCT(#{key})").where("#{key} LIKE ?", "%#{query}%").map(&key)
  end
  
  def correct_time
    if !start_hour || !start_min || !end_hour || !end_min || start_hour > end_hour || (start_hour == end_hour && start_min >= end_min)
      errors.add(:start_hour, "Podane godziny są niepoprawne")
    end
  end
  
  def invalidate_cache
    schedule.invalidate_cache
  end
  
end
