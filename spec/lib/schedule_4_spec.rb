# encoding: utf-8
require 'spec_helper'


describe "Schedule 4" do
  it "should work" do
    schedule, entries = parse_schedule 4
    schedule.should be_valid
    
    schedule.year.should == "2010/2011"
    schedule.semester.should == Epure::Config::SUMMER
    entries.size.should == 16

    entries[0].course_code.should == "ETEK00009W"
    entries[0].course_name.should == "Kryptografia i kodowanie"
    entries[0].course_type.should == "W"
    entries[0].group_code.should == "E03-40a"
    entries[0].lecturer.should == "Dr inż. Robert Borowiec"
    entries[0].week_day.should == 0
    entries[0].week.should == 0
    entries[0].start_hour.should == 11
    entries[0].start_min.should == 15
    entries[0].end_hour.should == 13
    entries[0].end_min.should == 0
    entries[0].building.should == "C-1"
    entries[0].room.should == "201"

    entries[1].course_code.should == "ETEK00002L"
    entries[1].course_name.should == "Sieci komputerowe"
    entries[1].course_type.should == "L"
    entries[1].group_code.should == "E03-32d"
    entries[1].lecturer.should == "Mgr inż. Sławomir Kubal"
    entries[1].week_day.should == 0
    entries[1].week.should == 0
    entries[1].start_hour.should == 15
    entries[1].start_min.should == 15
    entries[1].end_hour.should == 16
    entries[1].end_min.should == 55
    entries[1].building.should == "C-5"
    entries[1].room.should == "905"

    entries[2].course_code.should == "ETEW00006L"
    entries[2].course_name.should == "Podstawy techn. mikroproc..."
    entries[2].course_type.should == "L"
    entries[2].group_code.should == "E02-88ax"
    entries[2].lecturer.should == "Dr inż. Jacek Skrzypczyński"
    entries[2].week_day.should == 0
    entries[2].week.should == 1
    entries[2].start_hour.should == 13
    entries[2].start_min.should == 15
    entries[2].end_hour.should == 15
    entries[2].end_min.should == 0
    entries[2].building.should == "C-5"
    entries[2].room.should == "708"

    entries[3].course_code.should == "ETEK00010P"
    entries[3].course_name.should == "Eksploatacja systemów ....."
    entries[3].course_type.should == "P"
    entries[3].group_code.should == "E03-41c"
    entries[3].lecturer.should == "Dr inż. Andrzej Jaroch"
    entries[3].week_day.should == 0
    entries[3].week.should == 2
    entries[3].start_hour.should == 13
    entries[3].start_min.should == 15
    entries[3].end_hour.should == 15
    entries[3].end_min.should == 0
    entries[3].building.should == "C-5"
    entries[3].room.should == "705"

    entries[4].course_code.should == "ETEK00011P"
    entries[4].course_name.should == "Układy elektroniczne 1"
    entries[4].course_type.should == "P"
    entries[4].group_code.should == "E03-43g"
    entries[4].lecturer.should == "Dr inż. Rafał Zdunek"
    entries[4].week_day.should == 0
    entries[4].week.should == 2
    entries[4].start_hour.should == 17
    entries[4].start_min.should == 5
    entries[4].end_hour.should == 18
    entries[4].end_min.should == 45
    entries[4].building.should == "C-4"
    entries[4].room.should == "142"

    entries[5].course_code.should == "ETEK00011W"
    entries[5].course_name.should == "Układy elektroniczne 1"
    entries[5].course_type.should == "W"
    entries[5].group_code.should == "E03-44a"
    entries[5].lecturer.should == "Dr inż. Grzegorz Beziuk"
    entries[5].week_day.should == 1
    entries[5].week.should == 0
    entries[5].start_hour.should == 7
    entries[5].start_min.should == 30
    entries[5].end_hour.should == 9
    entries[5].end_min.should == 0
    entries[5].building.should == "C-1"
    entries[5].room.should == "201"

    entries[6].course_code.should == "ETEK00013W"
    entries[6].course_name.should == "Elementy elektroniczne"
    entries[6].course_type.should == "W"
    entries[6].group_code.should == "E03-45b"
    entries[6].lecturer.should == "Dr inż. Grzegorz Beziuk"
    entries[6].week_day.should == 1
    entries[6].week.should == 0
    entries[6].start_hour.should == 9
    entries[6].start_min.should == 15
    entries[6].end_hour.should == 11
    entries[6].end_min.should == 0
    entries[6].building.should == "C-1"
    entries[6].room.should == "201"

    entries[7].course_code.should == "ETEK00007L"
    entries[7].course_name.should == "Technika analogowa 2"
    entries[7].course_type.should == "L"
    entries[7].group_code.should == "E03-37o"
    entries[7].lecturer.should == "Dr inż. Jerzy Matacz"
    entries[7].week_day.should == 1
    entries[7].week.should == 0
    entries[7].start_hour.should == 13
    entries[7].start_min.should == 15
    entries[7].end_hour.should == 16
    entries[7].end_min.should == 0
    entries[7].building.should == "C-4"
    entries[7].room.should == "247A"

    entries[8].course_code.should == "ETEW00006W"
    entries[8].course_name.should == "Podstawy techn. mikroproc...."
    entries[8].course_type.should == "W"
    entries[8].group_code.should == "E02-89d"
    entries[8].lecturer.should == "Dr inż. Jarosław Emilianowicz"
    entries[8].week_day.should == 2
    entries[8].week.should == 0
    entries[8].start_hour.should == 13
    entries[8].start_min.should == 15
    entries[8].end_hour.should == 15
    entries[8].end_min.should == 0
    entries[8].building.should == "C-1"
    entries[8].room.should == "201"

    entries[9].course_code.should == "ETEK00005L"
    entries[9].course_name.should == "Technika cyfrowa 2"
    entries[9].course_type.should == "L"
    entries[9].group_code.should == "E03-34k"
    entries[9].lecturer.should == "Dr inż. Tomasz Długosz"
    entries[9].week_day.should == 2
    entries[9].week.should == 0
    entries[9].start_hour.should == 15
    entries[9].start_min.should == 15
    entries[9].end_hour.should == 16
    entries[9].end_min.should == 55
    entries[9].building.should == "C-5"
    entries[9].room.should == "708"

    entries[10].course_code.should == "ETEK00010W"
    entries[10].course_name.should == "Eksploatacja systemów ...."
    entries[10].course_type.should == "W"
    entries[10].group_code.should == "E03-42b"
    entries[10].lecturer.should == "Dr inż. Jacek Oko"
    entries[10].week_day.should == 2
    entries[10].week.should == 1
    entries[10].start_hour.should == 11
    entries[10].start_min.should == 15
    entries[10].end_hour.should == 13
    entries[10].end_min.should == 0
    entries[10].building.should == "C-1"
    entries[10].room.should == "201"

    entries[11].course_code.should == "ETEK00014W"
    entries[11].course_name.should == "Technika B. W. Cz."
    entries[11].course_type.should == "W"
    entries[11].group_code.should == "E03-46a"
    entries[11].lecturer.should == "Prof. dr hab. inż. Krzysztof Sachse"
    entries[11].week_day.should == 3
    entries[11].week.should == 0
    entries[11].start_hour.should == 11
    entries[11].start_min.should == 15
    entries[11].end_hour.should == 13
    entries[11].end_min.should == 0
    entries[11].building.should == "C-1"
    entries[11].room.should == "205"

    entries[12].course_code.should == "ETEK00005W"
    entries[12].course_name.should == "Technika cyfrowa 2"
    entries[12].course_type.should == "W"
    entries[12].group_code.should == "E03-35a"
    entries[12].lecturer.should == "Dr inż. Sławomir Sambor"
    entries[12].week_day.should == 3
    entries[12].week.should == 1
    entries[12].start_hour.should == 9
    entries[12].start_min.should == 15
    entries[12].end_hour.should == 11
    entries[12].end_min.should == 0
    entries[12].building.should == "C-1"
    entries[12].room.should == "201"

    entries[13].course_code.should == "ETEK00009C"
    entries[13].course_name.should == "Kryptografia i kodowanie"
    entries[13].course_type.should == "C"
    entries[13].group_code.should == "E03-39d"
    entries[13].lecturer.should == "Mgr inż. Piotr Kocyan"
    entries[13].week_day.should == 3
    entries[13].week.should == 1
    entries[13].start_hour.should == 13
    entries[13].start_min.should == 15
    entries[13].end_hour.should == 15
    entries[13].end_min.should == 0
    entries[13].building.should == "C-4"
    entries[13].room.should == "32"

    entries[14].course_code.should == "ETEK00002W"
    entries[14].course_name.should == "Sieci komputerowe"
    entries[14].course_type.should == "W"
    entries[14].group_code.should == "E03-33a"
    entries[14].lecturer.should == "Mgr inż. Jarosław Janukiewicz"
    entries[14].week_day.should == 3
    entries[14].week.should == 2
    entries[14].start_hour.should == 9
    entries[14].start_min.should == 15
    entries[14].end_hour.should == 11
    entries[14].end_min.should == 0
    entries[14].building.should == "C-1"
    entries[14].room.should == "201"

    entries[15].course_code.should == "ETEK00007C"
    entries[15].course_name.should == "Technika analogowa 2"
    entries[15].course_type.should == "C"
    entries[15].group_code.should == "E03-36b"
    entries[15].lecturer.should == "Dr inż. Lesław Dereń"
    entries[15].week_day.should == 3
    entries[15].week.should == 2
    entries[15].start_hour.should == 13
    entries[15].start_min.should == 15
    entries[15].end_hour.should == 15
    entries[15].end_min.should == 0
    entries[15].building.should == "C-4"
    entries[15].room.should == "33"
  end
end
