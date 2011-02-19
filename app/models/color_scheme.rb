class ColorScheme < ActiveRecord::Base
  attr_accessible :background, :border, :font
  
  belongs_to :schedule
end
