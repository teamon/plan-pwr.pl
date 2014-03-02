class ColorScheme < ActiveRecord::Base
  # attr_accessible :background, :border, :font

  belongs_to :schedule

  def name
    Epure::Config::COURSE_TYPES_NAMES[course_type]
  end
end
