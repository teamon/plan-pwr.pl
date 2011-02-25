# encoding: utf-8
require 'spec_helper'


describe "Schedule 1" do
  it "should work" do
    schedule, entries = parse_schedule 1
    schedule.should be_valid
    
    schedule.year.should == "2010/2011"
    schedule.semester.should == Epure::Config::WINTER
    entries.size.should == 18
    
    entries[0].course_code.should == "ETEK00013W"
    entries[0].course_name.should == "Elementy elektroniczne"
    entries[0].course_type.should == "W"
    entries[0].group_code.should == "E03-45a"
    entries[0].lecturer.should == "Prof. dr hab. inż. Janusz Mroczka"
    entries[0].week_day.should == 0
    entries[0].week.should == 0
    entries[0].start_hour.should == 13
    entries[0].start_min.should == 15
    entries[0].end_hour.should == 15
    entries[0].end_min.should == 0
    entries[0].building.should == "C-1"
    entries[0].room.should == "201"

    entries[1].course_code.should == "ETEK00009W"
    entries[1].course_name.should == "Kryptografia i kodowanie"
    entries[1].course_type.should == "W"
    entries[1].group_code.should == "E03-40b"
    entries[1].lecturer.should == "Dr inż. Robert Borowiec"
    entries[1].week_day.should == 0
    entries[1].week.should == 0
    entries[1].start_hour.should == 15
    entries[1].start_min.should == 15
    entries[1].end_hour.should == 16
    entries[1].end_min.should == 55
    entries[1].building.should == "C-1"
    entries[1].room.should == "201"

    entries[2].course_code.should == "ETEK00002L"
    entries[2].course_name.should == "Sieci komputerowe"
    entries[2].course_type.should == "L"
    entries[2].group_code.should == "E03-32r"
    entries[2].lecturer.should == "Mgr inż. Sławomir Kubal"
    entries[2].week_day.should == 0
    entries[2].week.should == 0
    entries[2].start_hour.should == 17
    entries[2].start_min.should == 5
    entries[2].end_hour.should == 18
    entries[2].end_min.should == 45
    entries[2].building.should == "C-5"
    entries[2].room.should == "905"

    entries[3].course_code.should == "ETEK00003C"
    entries[3].course_name.should == "Podstawy teorii pola EM"
    entries[3].course_type.should == "C"
    entries[3].group_code.should == "E04-37b"
    entries[3].lecturer.should == "Dr inż. Janusz Rzepka"
    entries[3].week_day.should == 1
    entries[3].week.should == 0
    entries[3].start_hour.should == 7
    entries[3].start_min.should == 30
    entries[3].end_hour.should == 9
    entries[3].end_min.should == 0
    entries[3].building.should == "C-4"
    entries[3].room.should == "33"

    entries[4].course_code.should == "ETEK00014W"
    entries[4].course_name.should == "Technika B. W. Cz."
    entries[4].course_type.should == "W"
    entries[4].group_code.should == "E03-46b"
    entries[4].lecturer.should == "Prof. dr hab. inż. Krzysztof Sachse"
    entries[4].week_day.should == 1
    entries[4].week.should == 0
    entries[4].start_hour.should == 15
    entries[4].start_min.should == 15
    entries[4].end_hour.should == 16
    entries[4].end_min.should == 55
    entries[4].building.should == "C-1"
    entries[4].room.should == "201"

    entries[5].course_code.should == "ETEK00011W"
    entries[5].course_name.should == "Układy elektroniczne 1"
    entries[5].course_type.should == "W"
    entries[5].group_code.should == "E03-44b"
    entries[5].lecturer.should == "Dr inż. Jerzy Witkowski"
    entries[5].week_day.should == 1
    entries[5].week.should == 0
    entries[5].start_hour.should == 17
    entries[5].start_min.should == 5
    entries[5].end_hour.should == 18
    entries[5].end_min.should == 45
    entries[5].building.should == "C-1"
    entries[5].room.should == "201"

    entries[6].course_code.should == "ETEK00010P"
    entries[6].course_name.should == "Eksploatacja systemów ....."
    entries[6].course_type.should == "P"
    entries[6].group_code.should == "E03-41q"
    entries[6].lecturer.should == "Dr inż. Rafał Królikowski"
    entries[6].week_day.should == 1
    entries[6].week.should == 1
    entries[6].start_hour.should == 11
    entries[6].start_min.should == 15
    entries[6].end_hour.should == 13
    entries[6].end_min.should == 0
    entries[6].building.should == "C-5"
    entries[6].room.should == "705"

    entries[7].course_code.should == "ETEK00009C"
    entries[7].course_name.should == "Kryptografia i kodowanie"
    entries[7].course_type.should == "C"
    entries[7].group_code.should == "E03-39b"
    entries[7].lecturer.should == "Mgr inż. Piotr Kocyan"
    entries[7].week_day.should == 1
    entries[7].week.should == 1
    entries[7].start_hour.should == 13
    entries[7].start_min.should == 15
    entries[7].end_hour.should == 15
    entries[7].end_min.should == 0
    entries[7].building.should == "C-4"
    entries[7].room.should == "32"

    entries[8].course_code.should == "ETEW00006L"
    entries[8].course_name.should == "Podstawy techn. mikroproc..."
    entries[8].course_type.should == "L"
    entries[8].group_code.should == "E02-88bi"
    entries[8].lecturer.should == "Dr inż. Andrzej Stępień"
    entries[8].week_day.should == 1
    entries[8].week.should == 2
    entries[8].start_hour.should == 11
    entries[8].start_min.should == 15
    entries[8].end_hour.should == 13
    entries[8].end_min.should == 0
    entries[8].building.should == "E-1"
    entries[8].room.should == "102"

    entries[9].course_code.should == "ETEK00003W"
    entries[9].course_name.should == "Podstawy teorii pola EM"
    entries[9].course_type.should == "W"
    entries[9].group_code.should == "E04-38b"
    entries[9].lecturer.should == "Dr inż. Janusz Rzepka"
    entries[9].week_day.should == 2
    entries[9].week.should == 0
    entries[9].start_hour.should == 7
    entries[9].start_min.should == 30
    entries[9].end_hour.should == 9
    entries[9].end_min.should == 0
    entries[9].building.should == "C-1"
    entries[9].room.should == "205"

    entries[10].course_code.should == "ETEW00006W"
    entries[10].course_name.should == "Podstawy techn. mikroproc...."
    entries[10].course_type.should == "W"
    entries[10].group_code.should == "E02-89c"
    entries[10].lecturer.should == "Dr inż. Andrzej Stępień"
    entries[10].week_day.should == 2
    entries[10].week.should == 0
    entries[10].start_hour.should == 9
    entries[10].start_min.should == 15
    entries[10].end_hour.should == 11
    entries[10].end_min.should == 0
    entries[10].building.should == "C-1"
    entries[10].room.should == "201"

    entries[11].course_code.should == "ETEK00010W"
    entries[11].course_name.should == "Eksploatacja systemów ...."
    entries[11].course_type.should == "W"
    entries[11].group_code.should == "E03-42a"
    entries[11].lecturer.should == "Dr inż. Jacek Oko"
    entries[11].week_day.should == 2
    entries[11].week.should == 2
    entries[11].start_hour.should == 11
    entries[11].start_min.should == 15
    entries[11].end_hour.should == 13
    entries[11].end_min.should == 0
    entries[11].building.should == "C-1"
    entries[11].room.should == "201"

    entries[12].course_code.should == "ETEK00005L"
    entries[12].course_name.should == "Technika cyfrowa 2"
    entries[12].course_type.should == "L"
    entries[12].group_code.should == "E03-34b"
    entries[12].lecturer.should == "Dr inż. Jacek Mazurkiewicz"
    entries[12].week_day.should == 2
    entries[12].week.should == 2
    entries[12].start_hour.should == 13
    entries[12].start_min.should == 15
    entries[12].end_hour.should == 16
    entries[12].end_min.should == 0
    entries[12].building.should == "C-3"
    entries[12].room.should == "019A"

    entries[13].course_code.should == "ETEK00005W"
    entries[13].course_name.should == "Technika cyfrowa 2"
    entries[13].course_type.should == "W"
    entries[13].group_code.should == "E03-35a"
    entries[13].lecturer.should == "Dr inż. Sławomir Sambor"
    entries[13].week_day.should == 3
    entries[13].week.should == 1
    entries[13].start_hour.should == 9
    entries[13].start_min.should == 15
    entries[13].end_hour.should == 11
    entries[13].end_min.should == 0
    entries[13].building.should == "C-1"
    entries[13].room.should == "201"

    entries[14].course_code.should == "ETEK00007C"
    entries[14].course_name.should == "Technika analogowa 2"
    entries[14].course_type.should == "C"
    entries[14].group_code.should == "E03-36c"
    entries[14].lecturer.should == "Dr inż. Lesław Dereń"
    entries[14].week_day.should == 3
    entries[14].week.should == 1
    entries[14].start_hour.should == 13
    entries[14].start_min.should == 15
    entries[14].end_hour.should == 15
    entries[14].end_min.should == 0
    entries[14].building.should == "C-4"
    entries[14].room.should == "33"

    entries[15].course_code.should == "ETEK00011P"
    entries[15].course_name.should == "Układy elektroniczne 1"
    entries[15].course_type.should == "P"
    entries[15].group_code.should == "E03-43t"
    entries[15].lecturer.should == "Dr inż. Adam Wąż"
    entries[15].week_day.should == 3
    entries[15].week.should == 2
    entries[15].start_hour.should == 11
    entries[15].start_min.should == 15
    entries[15].end_hour.should == 13
    entries[15].end_min.should == 0
    entries[15].building.should == "C-4"
    entries[15].room.should == "142"

    entries[16].course_code.should == "ETEK00007L"
    entries[16].course_name.should == "Technika analogowa 2"
    entries[16].course_type.should == "L"
    entries[16].group_code.should == "E03-37v"
    entries[16].lecturer.should == "Dr inż. Czesław Michalik"
    entries[16].week_day.should == 4
    entries[16].week.should == 0
    entries[16].start_hour.should == 8
    entries[16].start_min.should == 15
    entries[16].end_hour.should == 11
    entries[16].end_min.should == 0
    entries[16].building.should == "C-4"
    entries[16].room.should == "247B"

    entries[17].course_code.should == "ETEK00002W"
    entries[17].course_name.should == "Sieci komputerowe"
    entries[17].course_type.should == "W"
    entries[17].group_code.should == "E03-33b"
    entries[17].lecturer.should == "Dr inż. Waldemar Grzebyk"
    entries[17].week_day.should == 4
    entries[17].week.should == 2
    entries[17].start_hour.should == 11
    entries[17].start_min.should == 15
    entries[17].end_hour.should == 13
    entries[17].end_min.should == 0
    entries[17].building.should == "C-1"
    entries[17].room.should == "201"
  end
end
