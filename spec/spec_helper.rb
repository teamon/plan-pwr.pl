require 'spork'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  # Checks for pending migrations before tests are run.
  # If you are not using ActiveRecord, you can remove this line.
  ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

  RSpec.configure do |config|
    config.use_transactional_fixtures = false
    config.order = "random"

    config.expect_with :rspec do |c|
      c.syntax = :should
    end
  end
end

def parse_schedule(n)
  raw = File.read(File.join(File.dirname(__FILE__), "lib", "data", "schedule-#{n}.html"))
  schedule = Epure::Parser.parse!(raw)
  entries = schedule.entries
  [schedule, entries]
end

def print_schedule(schedule)
  entries = schedule.entries
  sem = schedule.semester == 2 ? "SUMMER" : "WINTER"

  puts <<-EOS
schedule.year.should == "#{schedule.year}"
schedule.semester.should == Epure::Config::#{sem}
entries.size.should == #{entries.size}

EOS

  entries.each.with_index do |e, i|
    puts <<-EOS
entries[#{i}].course_code.should == "#{e.course_code}"
entries[#{i}].course_name.should == "#{e.course_name}"
entries[#{i}].course_type.should == "#{e.course_type}"
entries[#{i}].group_code.should == "#{e.group_code}"
entries[#{i}].lecturer.should == "#{e.lecturer}"
entries[#{i}].week_day.should == #{e.week_day}
entries[#{i}].week.should == #{e.week}
entries[#{i}].start_hour.should == #{e.start_hour}
entries[#{i}].start_min.should == #{e.start_min}
entries[#{i}].end_hour.should == #{e.end_hour}
entries[#{i}].end_min.should == #{e.end_min}
entries[#{i}].building.should == "#{e.building}"
entries[#{i}].room.should == "#{e.room}"

EOS
  end
end

def print_errors(schedule)
  schedule.valid?
  Rails.logger.debug schedule.errors
  Rails.logger.debug schedule.entries.map {|e| e.errors }
end
