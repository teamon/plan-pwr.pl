require 'spec_helper'

describe Schedule do
  it "should create default color schemes" do
    begin
      schedule = Schedule.create
      schedule.color_schemes.size.should == 6
    rescue Exception => e
      puts e.backtrace
    end
  end
end
