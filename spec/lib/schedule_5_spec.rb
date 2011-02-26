# encoding: utf-8
require 'spec_helper'


describe "Schedule 5" do
  it "should work" do
    schedule, entries = parse_schedule 5
    schedule.should be_valid

    schedule.year.should == "2010/2011"
    schedule.semester.should == Epure::Config::SUMMER
    entries.size.should == 12

    entries[0].course_code.should == "IBB000714L"
    entries[0].course_name.should == "Technologia betonów i zapraw"
    entries[0].course_type.should == "L"
    entries[0].group_code.should == "B02-20a"
    entries[0].lecturer.should == "Dr inż. Marta Moczko"
    entries[0].week_day.should == 0
    entries[0].week.should == 0
    entries[0].start_hour.should == 9
    entries[0].start_min.should == 15
    entries[0].end_hour.should == 11
    entries[0].end_min.should == 0
    entries[0].building.should == "C-7"
    entries[0].room.should == "8"

    entries[1].course_code.should == "ibb000814w"
    entries[1].course_name.should == "Konstrukcje betonowe-podstawy"
    entries[1].course_type.should == "W"
    entries[1].group_code.should == "B02-23b"
    entries[1].lecturer.should == "Dr inż. Roman Wróblewski"
    entries[1].week_day.should == 0
    entries[1].week.should == 0
    entries[1].start_hour.should == 15
    entries[1].start_min.should == 15
    entries[1].end_hour.should == 16
    entries[1].end_min.should == 55
    entries[1].building.should == "C-7"
    entries[1].room.should == "101"

    entries[2].course_code.should == "IBB000914W"
    entries[2].course_name.should == "Konstrukcje metalowe-podstawy"
    entries[2].course_type.should == "W"
    entries[2].group_code.should == "B02-25a"
    entries[2].lecturer.should == "Prof. dr hab. inż. Kazimierz Rykaluk"
    entries[2].week_day.should == 0
    entries[2].week.should == 0
    entries[2].start_hour.should == 17
    entries[2].start_min.should == 5
    entries[2].end_hour.should == 18
    entries[2].end_min.should == 45
    entries[2].building.should == "C-7"
    entries[2].room.should == "102"

    entries[3].course_code.should == "ILB003714L"
    entries[3].course_name.should == "Mechanika budowli"
    entries[3].course_type.should == "L"
    entries[3].group_code.should == "B02-29d"
    entries[3].lecturer.should == "Mgr inż. Wojciech Zielichowski-Haber"
    entries[3].week_day.should == 0
    entries[3].week.should == 0
    entries[3].start_hour.should == 18
    entries[3].start_min.should == 55
    entries[3].end_hour.should == 20
    entries[3].end_min.should == 35
    entries[3].building.should == "A-1"
    entries[3].room.should == "249"

    entries[4].course_code.should == "ILB002314W"
    entries[4].course_name.should == "Wytrzymałość materiałów 2"
    entries[4].course_type.should == "W"
    entries[4].group_code.should == "B02-28c"
    entries[4].lecturer.should == ""
    entries[4].week_day.should == 1
    entries[4].week.should == 0
    entries[4].start_hour.should == 7
    entries[4].start_min.should == 30
    entries[4].end_hour.should == 9
    entries[4].end_min.should == 0
    entries[4].building.should == "A-1"
    entries[4].room.should == "301"

    entries[5].course_code.should == "GHB000414P"
    entries[5].course_name.should == "Mechanika gruntów"
    entries[5].course_type.should == "P"
    entries[5].group_code.should == "B02-32l"
    entries[5].lecturer.should == ""
    entries[5].week_day.should == 1
    entries[5].week.should == 2
    entries[5].start_hour.should == 15
    entries[5].start_min.should == 15
    entries[5].end_hour.should == 16
    entries[5].end_min.should == 55
    entries[5].building.should == "D-2"
    entries[5].room.should == "015"

    entries[6].course_code.should == "MAP001079W"
    entries[6].course_name.should == "Statystyka stosowana"
    entries[6].course_type.should == "W"
    entries[6].group_code.should == "B02-43b"
    entries[6].lecturer.should == "Dr Bogusława Bednarek-Kozek"
    entries[6].week_day.should == 2
    entries[6].week.should == 0
    entries[6].start_hour.should == 11
    entries[6].start_min.should == 15
    entries[6].end_hour.should == 13
    entries[6].end_min.should == 0
    entries[6].building.should == "C-7"
    entries[6].room.should == "404"

    entries[7].course_code.should == "IBB000614W"
    entries[7].course_name.should == "Budownictwo ogólne 2"
    entries[7].course_type.should == "W"
    entries[7].group_code.should == "B02-19c"
    entries[7].lecturer.should == "Dr hab. inż. Bohdan Stawiski"
    entries[7].week_day.should == 2
    entries[7].week.should == 0
    entries[7].start_hour.should == 15
    entries[7].start_min.should == 15
    entries[7].end_hour.should == 16
    entries[7].end_min.should == 55
    entries[7].building.should == "C-7"
    entries[7].room.should == "102"

    entries[8].course_code.should == "GHB000414W"
    entries[8].course_name.should == "Mechanika gruntów"
    entries[8].course_type.should == "W"
    entries[8].group_code.should == "B02-33b"
    entries[8].lecturer.should == "Prof. dr hab. inż. Ryszard Izbicki"
    entries[8].week_day.should == 2
    entries[8].week.should == 0
    entries[8].start_hour.should == 17
    entries[8].start_min.should == 5
    entries[8].end_hour.should == 18
    entries[8].end_min.should == 45
    entries[8].building.should == "A-1"
    entries[8].room.should == "301"

    entries[9].course_code.should == "IBB000914L"
    entries[9].course_name.should == "Konstrukcje metalowe-podstawy"
    entries[9].course_type.should == "L"
    entries[9].group_code.should == "B02-24o"
    entries[9].lecturer.should == "Mgr inż. Sławomir Rowiński"
    entries[9].week_day.should == 2
    entries[9].week.should == 2
    entries[9].start_hour.should == 7
    entries[9].start_min.should == 30
    entries[9].end_hour.should == 9
    entries[9].end_min.should == 0
    entries[9].building.should == "C-7"
    entries[9].room.should == "21"

    entries[10].course_code.should == "GHB000414L"
    entries[10].course_name.should == "Mechanika gruntów"
    entries[10].course_type.should == "L"
    entries[10].group_code.should == "B02-31r"
    entries[10].lecturer.should == ""
    entries[10].week_day.should == 2
    entries[10].week.should == 2
    entries[10].start_hour.should == 13
    entries[10].start_min.should == 15
    entries[10].end_hour.should == 15
    entries[10].end_min.should == 0
    entries[10].building.should == "D-2"
    entries[10].room.should == "014"

    entries[11].course_code.should == "ILB002314L"
    entries[11].course_name.should == "Wytrzymałość materiałów 2"
    entries[11].course_type.should == "L"
    entries[11].group_code.should == "B02-26j"
    entries[11].lecturer.should == ""
    entries[11].week_day.should == 1
    entries[11].week.should == 2
    entries[11].start_hour.should == 13
    entries[11].start_min.should == 15
    entries[11].end_hour.should == 15
    entries[11].end_min.should == 0
    entries[11].building.should == "A-1"
    entries[11].room.should == "14"
    
    pending "12/16 parsed"
  end
end
