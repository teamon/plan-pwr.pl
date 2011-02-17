class CreateSchedules < ActiveRecord::Migration
  def self.up
    create_table :schedules do |t|
      t.string :hash, :unique => true
      t.string :year
      t.integer :semester

      t.timestamps
    end
  end

  def self.down
    drop_table :schedules
  end
end
