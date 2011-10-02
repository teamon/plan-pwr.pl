# encoding: utf-8
require 'spec_helper'


describe "Schedule 11" do
  it "should work" do
    schedule, entries = parse_schedule 11
    schedule.should be_valid

    schedule.year.should == "2011/2012"
    schedule.semester.should == Epure::Config::WINTER
    entries.size.should == 9

    entries[0].course_code.should == "ISS303014L"
    entries[0].course_name.should == "Mechanika płynów"
    entries[0].course_type.should == "L"
    entries[0].group_code.should == "S02-07d"
    entries[0].lecturer.should == "Dr inż. Wojciech Mazurek"
    entries[0].week_day.should == 5
    entries[0].week.should == 0
    entries[0].start_hour.should == 17
    entries[0].start_min.should == 15
    entries[0].end_hour.should == 18
    entries[0].end_min.should == 45
    entries[0].building.should == "C-6"
    entries[0].room.should == "322"

    entries[1].course_code.should == "ISS303017C"
    entries[1].course_name.should == "Chemia wody"
    entries[1].course_type.should == "C"
    entries[1].group_code.should == "S02-11b"
    entries[1].lecturer.should == "Dr inż. Andrzej Biłyk"
    entries[1].week_day.should == 6
    entries[1].week.should == 0
    entries[1].start_hour.should == 16
    entries[1].start_min.should == 30
    entries[1].end_hour.should == 18
    entries[1].end_min.should == 0
    entries[1].building.should == "C-7"
    entries[1].room.should == "301"

    entries[2].course_code.should == "ISS303014W"
    entries[2].course_name.should == "Mechanika płynów"
    entries[2].course_type.should == "W"
    entries[2].group_code.should == "S02-08a"
    entries[2].lecturer.should == "Dr inż. Wojciech Mazurek"
    entries[2].week_day.should == 5
    entries[2].week.should == 0
    entries[2].start_hour.should == 12
    entries[2].start_min.should == 0
    entries[2].end_hour.should == 13
    entries[2].end_min.should == 30
    entries[2].building.should == "C-7"
    entries[2].room.should == "301"

    entries[3].course_code.should == "ISS303014C"
    entries[3].course_name.should == "Mechanika płynów"
    entries[3].course_type.should == "C"
    entries[3].group_code.should == "S02-06b"
    entries[3].lecturer.should == "Dr inż. Wojciech Mazurek"
    entries[3].week_day.should == 5
    entries[3].week.should == 0
    entries[3].start_hour.should == 13
    entries[3].start_min.should == 45
    entries[3].end_hour.should == 15
    entries[3].end_min.should == 15
    entries[3].building.should == "D-1"
    entries[3].room.should == "208"

    entries[4].course_code.should == "ISS303013W"
    entries[4].course_name.should == "Termodynamika"
    entries[4].course_type.should == "W"
    entries[4].group_code.should == "S02-05a"
    entries[4].lecturer.should == "Dr hab. inż. Józef Bednarski"
    entries[4].week_day.should == 6
    entries[4].week.should == 0
    entries[4].start_hour.should == 8
    entries[4].start_min.should == 0
    entries[4].end_hour.should == 9
    entries[4].end_min.should == 30
    entries[4].building.should == "D-2"
    entries[4].room.should == "301"

    entries[5].course_code.should == "ISS303013C"
    entries[5].course_name.should == "Termodynamika"
    entries[5].course_type.should == "C"
    entries[5].group_code.should == "S02-04a"
    entries[5].lecturer.should == "Dr hab. inż. Józef Bednarski"
    entries[5].week_day.should == 6
    entries[5].week.should == 0
    entries[5].start_hour.should == 9
    entries[5].start_min.should == 45
    entries[5].end_hour.should == 11
    entries[5].end_min.should == 15
    entries[5].building.should == "C-6"
    entries[5].room.should == "339"

    entries[6].course_code.should == "ISS303015L"
    entries[6].course_name.should == "Informat. podst. proj.-AutoCAD"
    entries[6].course_type.should == "L"
    entries[6].group_code.should == "S02-09c"
    entries[6].lecturer.should == "Mgr inż. Andrzej Jedlikowski"
    entries[6].week_day.should == 6
    entries[6].week.should == 0
    entries[6].start_hour.should == 11
    entries[6].start_min.should == 30
    entries[6].end_hour.should == 13
    entries[6].end_min.should == 00
    entries[6].building.should == "?"
    entries[6].room.should == "?"

    entries[7].course_code.should == "ISS303016W"
    entries[7].course_name.should == "Materiałoznawstwo"
    entries[7].course_type.should == "W"
    entries[7].group_code.should == "S02-10a"
    entries[7].lecturer.should == "Dr inż. Mieczysław Łuźniak"
    entries[7].week_day.should == 6
    entries[7].week.should == 0
    entries[7].start_hour.should == 13
    entries[7].start_min.should == 15
    entries[7].end_hour.should == 14
    entries[7].end_min.should == 45
    entries[7].building.should == "C-7"
    entries[7].room.should == "301"

    entries[8].course_code.should == "ISS303017W"
    entries[8].course_name.should == "Chemia wody"
    entries[8].course_type.should == "W"
    entries[8].group_code.should == "S02-12a"
    entries[8].lecturer.should == "Dr inż. Andrzej Biłyk"
    entries[8].week_day.should == 6
    entries[8].week.should == 0
    entries[8].start_hour.should == 15
    entries[8].start_min.should == 0
    entries[8].end_hour.should == 16
    entries[8].end_min.should == 30
    entries[8].building.should == "C-7"
    entries[8].room.should == "301"
  end
end
