# encoding: utf-8
require 'spec_helper'


describe "Schedule 13" do
  it "should work" do
    schedule, entries = parse_schedule 13
    schedule.should be_valid

    schedule.year.should == "2013/2014"
    schedule.semester.should == Epure::Config::SUMMER

    entries.size.should == 1
  end
end
