class CreateColorSchemes < ActiveRecord::Migration
  def self.up
    create_table :color_schemes do |t|
      t.integer :schedule_id
      t.string :course_type
      t.string :background
      t.string :border
      t.string :font
    end
  end

  def self.down
    drop_table :color_schemes
  end
end
