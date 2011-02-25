# encoding: utf-8
require 'spec_helper'


describe "Schedule 8" do
  it "should work" do
    schedule, entries = parse_schedule 8
    schedule.should be_valid
    
    schedule.year.should == "2010/2011"
    schedule.semester.should == Epure::Config::SUMMER
    entries.size.should == 10

    entries[0].course_code.should == "GPA009264W"
    entries[0].course_name.should == "Planowanie przestrzenne"
    entries[0].course_type.should == "W"
    entries[0].group_code.should == "S00-98a"
    entries[0].lecturer.should == "Dr Elżbieta Litwińska"
    entries[0].week_day.should == 6
    entries[0].week.should == 0
    entries[0].start_hour.should == 11
    entries[0].start_min.should == 30
    entries[0].end_hour.should == 13
    entries[0].end_min.should == 0
    entries[0].building.should == "D-2"
    entries[0].room.should == "301"

    entries[1].course_code.should == "ISS404039P"
    entries[1].course_name.should == "Wentylacja i Klimatyzacja 2"
    entries[1].course_type.should == "P"
    entries[1].group_code.should == "S01-10b"
    entries[1].lecturer.should == "Dr inż. Agnieszka Zając"
    entries[1].week_day.should == 5
    entries[1].week.should == 0
    entries[1].start_hour.should == 8
    entries[1].start_min.should == 0
    entries[1].end_hour.should == 9
    entries[1].end_min.should == 30
    entries[1].building.should == "C-6"
    entries[1].room.should == "325"

    entries[2].course_code.should == "ISS404049P"
    entries[2].course_name.should == "Instalacje sanitarne 1"
    entries[2].course_type.should == "P"
    entries[2].group_code.should == "S01-13b"
    entries[2].lecturer.should == "Dr inż. Iwona Polarczyk"
    entries[2].week_day.should == 5
    entries[2].week.should == 0
    entries[2].start_hour.should == 9
    entries[2].start_min.should == 45
    entries[2].end_hour.should == 11
    entries[2].end_min.should == 15
    entries[2].building.should == "C-6"
    entries[2].room.should == "325"

    entries[3].course_code.should == "ISS404049W"
    entries[3].course_name.should == "Instalacje sanitarne 1"
    entries[3].course_type.should == "W"
    entries[3].group_code.should == "S01-14a"
    entries[3].lecturer.should == "Dr hab. inż. Paweł Malinowski"
    entries[3].week_day.should == 5
    entries[3].week.should == 0
    entries[3].start_hour.should == 12
    entries[3].start_min.should == 0
    entries[3].end_hour.should == 13
    entries[3].end_min.should == 30
    entries[3].building.should == "D-2"
    entries[3].room.should == "301"

    entries[4].course_code.should == "ISS404004W"
    entries[4].course_name.should == "Niez. i bezp. sys. inż."
    entries[4].course_type.should == "W"
    entries[4].group_code.should == "S00-99b"
    entries[4].lecturer.should == "Dr hab. inż. Halina Hotloś"
    entries[4].week_day.should == 5
    entries[4].week.should == 0
    entries[4].start_hour.should == 13
    entries[4].start_min.should == 45
    entries[4].end_hour.should == 15
    entries[4].end_min.should == 15
    entries[4].building.should == "D-2"
    entries[4].room.should == "301"

    entries[5].course_code.should == "ISS404049L"
    entries[5].course_name.should == "Instalacje sanitarne 1"
    entries[5].course_type.should == "L"
    entries[5].group_code.should == "S01-12c"
    entries[5].lecturer.should == "Dr inż. Michał Fijewski"
    entries[5].week_day.should == 5
    entries[5].week.should == 0
    entries[5].start_hour.should == 8
    entries[5].start_min.should == 0
    entries[5].end_hour.should == 9
    entries[5].end_min.should == 30
    entries[5].building.should == "C-6"
    entries[5].room.should == "26"

    entries[6].course_code.should == "ISS404006W"
    entries[6].course_name.should == "Zarządzanie środowiskiem"
    entries[6].course_type.should == "W"
    entries[6].group_code.should == "S01-00b"
    entries[6].lecturer.should == "W07 W07"
    entries[6].week_day.should == 6
    entries[6].week.should == 0
    entries[6].start_hour.should == 8
    entries[6].start_min.should == 0
    entries[6].end_hour.should == 9
    entries[6].end_min.should == 30
    entries[6].building.should == "D-2"
    entries[6].room.should == "301"

    entries[7].course_code.should == "ISS404011W"
    entries[7].course_name.should == "Chemia środowiska 2"
    entries[7].course_type.should == "W"
    entries[7].group_code.should == "S01-01b"
    entries[7].lecturer.should == "W07 W07"
    entries[7].week_day.should == 6
    entries[7].week.should == 0
    entries[7].start_hour.should == 11
    entries[7].start_min.should == 30
    entries[7].end_hour.should == 13
    entries[7].end_min.should == 0
    entries[7].building.should == "D-2"
    entries[7].room.should == "301"

    entries[8].course_code.should == "ISS404039W"
    entries[8].course_name.should == "Wentylacja i Klimatyzacja 2"
    entries[8].course_type.should == "W"
    entries[8].group_code.should == "S01-11a"
    entries[8].lecturer.should == "Prof. dr hab. inż. Sergey Anisimov"
    entries[8].week_day.should == 6
    entries[8].week.should == 0
    entries[8].start_hour.should == 9
    entries[8].start_min.should == 45
    entries[8].end_hour.should == 11
    entries[8].end_min.should == 15
    entries[8].building.should == "C-6"
    entries[8].room.should == "58"

    entries[9].course_code.should == "JZL001002C"
    entries[9].course_name.should == "Język niemiecki A1- NZ"
    entries[9].course_type.should == "C"
    entries[9].group_code.should == "S01-07e"
    entries[9].lecturer.should == "Dr Anna Kapuściarek"
    entries[9].week_day.should == 6
    entries[9].week.should == 0
    entries[9].start_hour.should == 13
    entries[9].start_min.should == 30
    entries[9].end_hour.should == 16
    entries[9].end_min.should == 10
    entries[9].building.should == "H-4"
    entries[9].room.should == "412"
  end
end
