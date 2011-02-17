class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.integer :schedule_id
      t.string :course_code
      t.string :course_name
      t.string :group_name
      t.string :course_type
      t.integer :week
      t.integer :week_day
      t.integer :start_hour
      t.integer :start_min
      t.integer :end_hour
      t.integer :end_min
      t.string :building
      t.string :room
      t.string :lecturer

      t.timestamps
    end
  end

  def self.down
    drop_table :entries
  end
end
