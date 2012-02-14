class CreateIndices < ActiveRecord::Migration
  def self.up
    add_index :schedules, :slug
    add_index :entries, :lecturer
    add_index :entries, :course_name
    add_index :color_schemes, :schedule_id
  end

  def self.down
    remove_index :color_schemes, :schedule_id
    remove_index :entries, :course_name
    remove_index :entries, :lecturer
    remove_index :schedules, :slug
  end
end
