class Schedule < ActiveRecord::Base
  attr_accessor :raw
  attr_accessible :year, :semester
  
  has_many :entries

  def generate_hash!
    self.hash = rand(36**8).to_s(36) + id.to_s(36)
    save
  end
end
