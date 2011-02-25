# encoding: utf-8
require 'spec_helper'


describe "Schedule 6" do
  it "should work" do
    schedule, entries = parse_schedule 6
    schedule.should be_valid
    
    schedule.year.should == "2010/2011"
    schedule.semester.should == Epure::Config::SUMMER
    entries.size.should == 17

    entries[0].course_code.should == "MMM001701L"
    entries[0].course_name.should == "Discreet process modelling"
    entries[0].course_type.should == "L"
    entries[0].group_code.should == "M03-53b"
    entries[0].lecturer.should == "Dr inż. Sławomir Susz"
    entries[0].week_day.should == 1
    entries[0].week.should == 0
    entries[0].start_hour.should == 7
    entries[0].start_min.should == 30
    entries[0].end_hour.should == 9
    entries[0].end_min.should == 0
    entries[0].building.should == "B-4"
    entries[0].room.should == "4.29"

    entries[1].course_code.should == "MMM006844W"
    entries[1].course_name.should == "Biomateriały w Medycynie"
    entries[1].course_type.should == "W"
    entries[1].group_code.should == "M05-12a"
    entries[1].lecturer.should == "Dr inż. Anna Nikodem"
    entries[1].week_day.should == 2
    entries[1].week.should == 0
    entries[1].start_hour.should == 9
    entries[1].start_min.should == 15
    entries[1].end_hour.should == 11
    entries[1].end_min.should == 0
    entries[1].building.should == "B-1"
    entries[1].room.should == "117"

    entries[2].course_code.should == "MMM001703W"
    entries[2].course_name.should == "Innovative mechanical technolo"
    entries[2].course_type.should == "W"
    entries[2].group_code.should == "M03-58a"
    entries[2].lecturer.should == "Dr inż. Bogdan Dybała"
    entries[2].week_day.should == 2
    entries[2].week.should == 0
    entries[2].start_hour.should == 13
    entries[2].start_min.should == 15
    entries[2].end_hour.should == 15
    entries[2].end_min.should == 0
    entries[2].building.should == "B-5"
    entries[2].room.should == "300"

    entries[3].course_code.should == "MMM001700W"
    entries[3].course_name.should == "Projecy & innovation managem.."
    entries[3].course_type.should == "W"
    entries[3].group_code.should == "M03-52a"
    entries[3].lecturer.should == "Dr inż. Krzysztof Kędzia"
    entries[3].week_day.should == 2
    entries[3].week.should == 1
    entries[3].start_hour.should == 11
    entries[3].start_min.should == 15
    entries[3].end_hour.should == 13
    entries[3].end_min.should == 0
    entries[3].building.should == "B-1"
    entries[3].room.should == "316"

    entries[4].course_code.should == "MMM001704W"
    entries[4].course_name.should == "Knowledge management"
    entries[4].course_type.should == "W"
    entries[4].group_code.should == "M03-60a"
    entries[4].lecturer.should == ""
    entries[4].week_day.should == 2
    entries[4].week.should == 1
    entries[4].start_hour.should == 15
    entries[4].start_min.should == 15
    entries[4].end_hour.should == 16
    entries[4].end_min.should == 55
    entries[4].building.should == "B-4"
    entries[4].room.should == "2.39"

    entries[5].course_code.should == "MMM001705L"
    entries[5].course_name.should == "Human recources management"
    entries[5].course_type.should == "L"
    entries[5].group_code.should == "M03-61a"
    entries[5].lecturer.should == "Dr inż. Tomasz Górnicz"
    entries[5].week_day.should == 2
    entries[5].week.should == 2
    entries[5].start_hour.should == 11
    entries[5].start_min.should == 15
    entries[5].end_hour.should == 13
    entries[5].end_min.should == 0
    entries[5].building.should == "B-5"
    entries[5].room.should == "7"

    entries[6].course_code.should == "MMM001701W"
    entries[6].course_name.should == "Discreet process modelling"
    entries[6].course_type.should == "W"
    entries[6].group_code.should == "M03-54a"
    entries[6].lecturer.should == "Dr inż. Sławomir Susz"
    entries[6].week_day.should == 3
    entries[6].week.should == 1
    entries[6].start_hour.should == 9
    entries[6].start_min.should == 15
    entries[6].end_hour.should == 11
    entries[6].end_min.should == 0
    entries[6].building.should == "B-4"
    entries[6].room.should == "2.37"

    entries[7].course_code.should == "MMM001717W"
    entries[7].course_name.should == "Monit & visal in manufactur"
    entries[7].course_type.should == "W"
    entries[7].group_code.should == "M05-57a"
    entries[7].lecturer.should == ""
    entries[7].week_day.should == 3
    entries[7].week.should == 1
    entries[7].start_hour.should == 13
    entries[7].start_min.should == 15
    entries[7].end_hour.should == 15
    entries[7].end_min.should == 0
    entries[7].building.should == "B-5"
    entries[7].room.should == "311"

    entries[8].course_code.should == "MMM001717L"
    entries[8].course_name.should == "Monit & visal in manufactur"
    entries[8].course_type.should == "L"
    entries[8].group_code.should == "M05-56a"
    entries[8].lecturer.should == ""
    entries[8].week_day.should == 3
    entries[8].week.should == 1
    entries[8].start_hour.should == 15
    entries[8].start_min.should == 15
    entries[8].end_hour.should == 16
    entries[8].end_min.should == 55
    entries[8].building.should == "B-4"
    entries[8].room.should == "4.29"

    entries[9].course_code.should == "MMM001703L"
    entries[9].course_name.should == "Innovative mechanical technolo"
    entries[9].course_type.should == "L"
    entries[9].group_code.should == "M03-57b"
    entries[9].lecturer.should == ""
    entries[9].week_day.should == 3
    entries[9].week.should == 1
    entries[9].start_hour.should == 17
    entries[9].start_min.should == 5
    entries[9].end_hour.should == 18
    entries[9].end_min.should == 45
    entries[9].building.should == "B-4"
    entries[9].room.should == "4.31"

    entries[10].course_code.should == "MMM001702W"
    entries[10].course_name.should == "Forecasting & simulat of prod"
    entries[10].course_type.should == "W"
    entries[10].group_code.should == "M03-56a"
    entries[10].lecturer.should == "Dr inż. Arkadiusz Kowalski"
    entries[10].week_day.should == 3
    entries[10].week.should == 2
    entries[10].start_hour.should == 9
    entries[10].start_min.should == 15
    entries[10].end_hour.should == 11
    entries[10].end_min.should == 0
    entries[10].building.should == "B-4"
    entries[10].room.should == "2.37"

    entries[11].course_code.should == "MMM006844L"
    entries[11].course_name.should == "Biomateriały w Medycynie"
    entries[11].course_type.should == "L"
    entries[11].group_code.should == "M05-11a"
    entries[11].lecturer.should == "Dr inż. Marzena Podrez-Radziszewska"
    entries[11].week_day.should == 3
    entries[11].week.should == 2
    entries[11].start_hour.should == 11
    entries[11].start_min.should == 15
    entries[11].end_hour.should == 13
    entries[11].end_min.should == 0
    entries[11].building.should == "B-1"
    entries[11].room.should == "204"

    entries[12].course_code.should == "MMM001705W"
    entries[12].course_name.should == "Human recources management"
    entries[12].course_type.should == "W"
    entries[12].group_code.should == "M03-62a"
    entries[12].lecturer.should == "Dr inż. Tomasz Górnicz"
    entries[12].week_day.should == 3
    entries[12].week.should == 2
    entries[12].start_hour.should == 11
    entries[12].start_min.should == 15
    entries[12].end_hour.should == 13
    entries[12].end_min.should == 0
    entries[12].building.should == "B-4"
    entries[12].room.should == "2.38"

    entries[13].course_code.should == "MMM001716W"
    entries[13].course_name.should == "Optomechatronics ald laser"
    entries[13].course_type.should == "W"
    entries[13].group_code.should == "M05-55b"
    entries[13].lecturer.should == "Dr inż. Jacek Reiner"
    entries[13].week_day.should == 3
    entries[13].week.should == 2
    entries[13].start_hour.should == 13
    entries[13].start_min.should == 15
    entries[13].end_hour.should == 15
    entries[13].end_min.should == 0
    entries[13].building.should == "B-5"
    entries[13].room.should == "311"

    entries[14].course_code.should == "MMM001702P"
    entries[14].course_name.should == "Forecasting & simulat of prod"
    entries[14].course_type.should == "P"
    entries[14].group_code.should == "M03-55b"
    entries[14].lecturer.should == "Dr inż. Arkadiusz Kowalski"
    entries[14].week_day.should == 4
    entries[14].week.should == 0
    entries[14].start_hour.should == 7
    entries[14].start_min.should == 30
    entries[14].end_hour.should == 9
    entries[14].end_min.should == 0
    entries[14].building.should == "B-4"
    entries[14].room.should == "4.31"

    entries[15].course_code.should == "MMM001700P"
    entries[15].course_name.should == "Projecy & innovation managem.."
    entries[15].course_type.should == "P"
    entries[15].group_code.should == "M03-51b"
    entries[15].lecturer.should == "Dr inż. Krzysztof Kędzia"
    entries[15].week_day.should == 4
    entries[15].week.should == 0
    entries[15].start_hour.should == 9
    entries[15].start_min.should == 15
    entries[15].end_hour.should == 11
    entries[15].end_min.should == 0
    entries[15].building.should == "B-5"
    entries[15].room.should == "7"

    entries[16].course_code.should == "MMM001704S"
    entries[16].course_name.should == "Knowledge management"
    entries[16].course_type.should == "S"
    entries[16].group_code.should == "M03-59c"
    entries[16].lecturer.should == ""
    entries[16].week_day.should == 4
    entries[16].week.should == 0
    entries[16].start_hour.should == 11
    entries[16].start_min.should == 15
    entries[16].end_hour.should == 13
    entries[16].end_min.should == 0
    entries[16].building.should == "B-4"
    entries[16].room.should == "4.27"
  end
end
