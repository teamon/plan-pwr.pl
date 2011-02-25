require 'spork'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    # == Mock Framework
    #
    # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
    #
    # config.mock_with :mocha
    # config.mock_with :flexmock
    # config.mock_with :rr
    config.mock_with :rspec

    # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
    # config.fixture_path = "#{::Rails.root}/spec/fixtures"

    # If you're not using ActiveRecord, or you'd prefer not to run each of your
    # examples within a transaction, remove the following line or assign false
    # instead of true.
    config.use_transactional_fixtures = true
  end
end

Spork.each_run do
  # This code will be run each time you run your specs.

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
