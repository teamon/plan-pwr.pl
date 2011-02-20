class Schedule < ActiveRecord::Base
  attr_accessor :raw
  attr_accessible :year, :semester, :color_schemes_attributes
  
  has_many :entries
  has_many :color_schemes
  accepts_nested_attributes_for :color_schemes
  
  after_create :generate_slug
  after_create :create_default_color_schemes

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
  
  def as_json(options={})
    super(:except => [:created_at, :updated_at, :id, :slug], 
          :include => { :entries => { :except => [:created_at, :updated_at, :id, :schedule_id] } })
  end
  
  def reset_color_schemes!
    color_schemes.destroy_all
    create_default_color_schemes
  end
  
  def bw_color_schemes!
    color_schemes.update_all(:background => "#fff", :border => "#000", :font => "#000")
  end
  
  protected
  
  def generate_slug
    self.slug = rand(36**8).to_s(36) + id.to_s(36)
    save
  end
  
  def create_default_color_schemes
    cs = color_schemes.new(:background => "#f3b6b7", :border => "#e63021", :font => "#e63021")
    cs.course_type = "W"
    cs.save
    
    cs = color_schemes.new(:background => "#aeed91", :border => "#47ae03", :font => "#47ae03")
    cs.course_type = "C"
    cs.save
    
    cs = color_schemes.new(:background => "#a5c4f7", :border => "#1c64dc", :font => "#1c64dc")
    cs.course_type = "L"
    cs.save
    
    cs = color_schemes.new(:background => "#efbcf0", :border => "#bb3abd", :font => "#bb3abd")
    cs.course_type = "P"
    cs.save
    
    cs = color_schemes.new(:background => "#f5dcc0", :border => "#f38e00", :font => "#f38e00")
    cs.course_type = "S"
    cs.save
    
    cs = color_schemes.new(:background => "#ccc1ec", :border => "#5c3ab2", :font => "#5c3ab2")
    cs.course_type = "X"
    cs.save
  end
end

