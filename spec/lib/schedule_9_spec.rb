# encoding: utf-8
require 'spec_helper'


describe "Schedule 9" do
  it "should work" do
    schedule, entries = parse_schedule 9
    schedule.should be_valid

    schedule.year.should == "2011/2012"
    schedule.semester.should == Epure::Config::WINTER
    entries.size.should == 10

    entries[0].course_code.should == "INZ001607W"
    entries[0].course_name.should == "Mobilne systemy informacyjne"
    entries[0].course_type.should == "W"
    entries[0].group_code.should == "Z00-40b"
    entries[0].lecturer.should == "Dr inż. Dariusz Król"
    entries[0].week_day.should == 0
    entries[0].week.should == 0
    entries[0].start_hour.should == 11
    entries[0].start_min.should == 15
    entries[0].end_hour.should == 13
    entries[0].end_min.should == 0
    entries[0].building.should == "B-4"
    entries[0].room.should == "227"

    entries[1].course_code.should == "INZ001603L"
    entries[1].course_name.should == "Integracja systemów informacyj"
    entries[1].course_type.should == "L"
    entries[1].group_code.should == "Z02-28a"
    entries[1].lecturer.should == "Prof. dr hab. inż. Przemysław Kazienko"
    entries[1].week_day.should == 1
    entries[1].week.should == 0
    entries[1].start_hour.should == 10
    entries[1].start_min.should == 15
    entries[1].end_hour.should == 14
    entries[1].end_min.should == 0
    entries[1].building.should == "D-2"
    entries[1].room.should == "127a"

    entries[2].course_code.should == "INZ001603L"
    entries[2].course_name.should == "Integracja systemów informacyj"
    entries[2].course_type.should == "L"
    entries[2].group_code.should == "Z02-28a"
    entries[2].lecturer.should == "Prof. dr hab. inż. Przemysław Kazienko"
    entries[2].week_day.should == 4
    entries[2].week.should == 0
    entries[2].start_hour.should == 8
    entries[2].start_min.should == 15
    entries[2].end_hour.should == 13
    entries[2].end_min.should == 0
    entries[2].building.should == "D-2"
    entries[2].room.should == "127a"

    entries[3].course_code.should == "INZ001603W"
    entries[3].course_name.should == "Integracja systemów informacyj"
    entries[3].course_type.should == "W"
    entries[3].group_code.should == "Z02-29a"
    entries[3].lecturer.should == "Prof. dr hab. inż. Przemysław Kazienko"
    entries[3].week_day.should == 0
    entries[3].week.should == 0
    entries[3].start_hour.should == 15
    entries[3].start_min.should == 15
    entries[3].end_hour.should == 16
    entries[3].end_min.should == 55
    entries[3].building.should == "D-1"
    entries[3].room.should == "29"

    entries[4].course_code.should == "INZ001602S"
    entries[4].course_name.should == "Perspektywy rozwoju systemów i"
    entries[4].course_type.should == "S"
    entries[4].group_code.should == "Z02-27a"
    entries[4].lecturer.should == "Dr inż. Andrzej Siemiński"
    entries[4].week_day.should == 0
    entries[4].week.should == 0
    entries[4].start_hour.should == 17
    entries[4].start_min.should == 5
    entries[4].end_hour.should == 18
    entries[4].end_min.should == 45
    entries[4].building.should == "A-1"
    entries[4].room.should == "202"

    entries[5].course_code.should == "INZ001607S"
    entries[5].course_name.should == "Mobilne systemy informacyjne"
    entries[5].course_type.should == "S"
    entries[5].group_code.should == "Z00-39b"
    entries[5].lecturer.should == "Dr inż. Dariusz Król"
    entries[5].week_day.should == 0
    entries[5].week.should == 1
    entries[5].start_hour.should == 9
    entries[5].start_min.should == 15
    entries[5].end_hour.should == 11
    entries[5].end_min.should == 0
    entries[5].building.should == "A-1"
    entries[5].room.should == "202"

    entries[6].course_code.should == "INZ001601W"
    entries[6].course_name.should == "Metodologia projektowania syst"
    entries[6].course_type.should == "W"
    entries[6].group_code.should == "Z02-26a"
    entries[6].lecturer.should == "Dr inż. Kazimierz Choroś"
    entries[6].week_day.should == 2
    entries[6].week.should == 0
    entries[6].start_hour.should == 13
    entries[6].start_min.should == 15
    entries[6].end_hour.should == 15
    entries[6].end_min.should == 0
    entries[6].building.should == "B-4"
    entries[6].room.should == "228"

    entries[7].course_code.should == "INZ001601P"
    entries[7].course_name.should == "Metodologia projektowania syst"
    entries[7].course_type.should == "P"
    entries[7].group_code.should == "Z02-25b"
    entries[7].lecturer.should == "Dr inż. Andrzej Siemiński"
    entries[7].week_day.should == 2
    entries[7].week.should == 0
    entries[7].start_hour.should == 17
    entries[7].start_min.should == 5
    entries[7].end_hour.should == 18
    entries[7].end_min.should == 45
    entries[7].building.should == "A-1"
    entries[7].room.should == "248"

    entries[8].course_code.should == "INZ001604W"
    entries[8].course_name.should == "Systemy informacyjne w działal"
    entries[8].course_type.should == "W"
    entries[8].group_code.should == "Z02-31a"
    entries[8].lecturer.should == "Dr inż. Bogdan Trawiński"
    entries[8].week_day.should == 3
    entries[8].week.should == 0
    entries[8].start_hour.should == 7
    entries[8].start_min.should == 30
    entries[8].end_hour.should == 9
    entries[8].end_min.should == 0
    entries[8].building.should == "B-4"
    entries[8].room.should == "228"

    entries[9].course_code.should == "INZ001604S"
    entries[9].course_name.should == "Systemy informacyjne w działal"
    entries[9].course_type.should == "S"
    entries[9].group_code.should == "Z02-30a"
    entries[9].lecturer.should == "Dr inż. Bogdan Trawiński"
    entries[9].week_day.should == 3
    entries[9].week.should == 0
    entries[9].start_hour.should == 11
    entries[9].start_min.should == 15
    entries[9].end_hour.should == 13
    entries[9].end_min.should == 0
    entries[9].building.should == "A-1"
    entries[9].room.should == "202"
  end
end
