class Schedule < ActiveRecord::Base
  attr_accessor :raw

  has_many :entries, :dependent => :destroy
  has_many :color_schemes, :dependent => :destroy
  accepts_nested_attributes_for :color_schemes

  after_create :generate_slug
  after_create :create_default_color_schemes
  after_update :invalidate_cache

  def days
    @days ||= begin
      d = entries.group_by {|e| e.week_day }
      x = d[6].blank? ? (d[5].blank? ? 4 : 5) : 6
      (0..x).each {|i| d[i] ||= []}
      d
    end
  end

  def semester_name
    Epure::Config::SEMESTERS_NAMES[semester]
  end

  def to_json(options = {})
    super(serialize_options)
  end

  def to_xml(options = {})
    super(serialize_options)
  end

  def serialize_options
    {
      :except => [:created_at, :updated_at, :id, :slug],
      :include => {
        :entries => {
          :except => [:created_at, :updated_at, :id, :schedule_id]
        }
      }
    }
  end

  def set_color_scheme(name)
    color_schemes.destroy_all
    Epure::Config::COLOR_SCHEMES[name].each_pair do |type, colors|
      cs = color_schemes.new(:background => colors[0], :border => colors[1], :font => colors[2])
      cs.course_type = type
      cs.save
    end

    color_schemes.reload
    invalidate_cache
  end

  def pwr?
    !(year.blank? || semester.blank?)
  end

  protected

  def generate_slug
    self.slug = rand(36**8).to_s(36) + id.to_s(36)
    save
  end

  def create_default_color_schemes
    set_color_scheme(:default)
  end

  def invalidate_cache
  #   FileUtils.rm_rf(File.join(Epure.cache_root, slug.gsub(/(.{2})/, "\\1/")))
  end
end
