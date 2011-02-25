# encoding: utf-8
require 'spec_helper'


describe "Schedule 7" do
  it "should work" do
    schedule, entries = parse_schedule 7
    schedule.should be_valid
    
    schedule.year.should == "2010/2011"
    schedule.semester.should == Epure::Config::SUMMER
    entries.size.should == 3

    entries[0].course_code.should == "INZ002526S"
    entries[0].course_name.should == "Seminarium dyplomowe"
    entries[0].course_type.should == "S"
    entries[0].group_code.should == "Z03-95d"
    entries[0].lecturer.should == "Dr hab. Zygmunt Mazur"
    entries[0].week_day.should == 1
    entries[0].week.should == 0
    entries[0].start_hour.should == 11
    entries[0].start_min.should == 15
    entries[0].end_hour.should == 13
    entries[0].end_min.should == 0
    entries[0].building.should == "C-7"
    entries[0].room.should == "201"

    entries[1].course_code.should == "FLH000134W"
    entries[1].course_name.should == "Wstęp do filozofii"
    entries[1].course_type.should == "W"
    entries[1].group_code.should == "Z01-74e"
    entries[1].lecturer.should == "Dr Andrzej Radzio"
    entries[1].week_day.should == 3
    entries[1].week.should == 0
    entries[1].start_hour.should == 15
    entries[1].start_min.should == 15
    entries[1].end_hour.should == 16
    entries[1].end_min.should == 55
    entries[1].building.should == "A-1"
    entries[1].room.should == "329"

    entries[2].course_code.should == "INZ004536W"
    entries[2].course_name.should == "Modele bezpieczeństwa i nie..."
    entries[2].course_type.should == "W"
    entries[2].group_code.should == "Z01-18b"
    entries[2].lecturer.should == "Prof. dr hab. inż. Ireneusz Jóźwiak"
    entries[2].week_day.should == 3
    entries[2].week.should == 0
    entries[2].start_hour.should == 17
    entries[2].start_min.should == 5
    entries[2].end_hour.should == 18
    entries[2].end_min.should == 45
    entries[2].building.should == "B-4"
    entries[2].room.should == "227"
  end
end
