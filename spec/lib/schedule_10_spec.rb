# encoding: utf-8
require 'spec_helper'


describe "Schedule 10" do
  it "should work" do
    schedule, entries = parse_schedule 10
    schedule.should be_valid

    schedule.year.should == "2011/2012"
    schedule.semester.should == Epure::Config::WINTER
    entries.size.should == 18

    entries[0].course_code.should == "MAP001149W"
    entries[0].course_name.should == "Analiza matematyczna 2.3 A"
    entries[0].course_type.should == "W"
    entries[0].group_code.should == "E05-92a"
    entries[0].lecturer.should == "Dr Piotr Pietraszkiewicz"
    entries[0].week_day.should == 1
    entries[0].week.should == 0
    entries[0].start_hour.should == 17
    entries[0].start_min.should == 5
    entries[0].end_hour.should == 18
    entries[0].end_min.should == 45
    entries[0].building.should == "C-5"
    entries[0].room.should == "3"

    entries[1].course_code.should == "INEK00015L"
    entries[1].course_name.should == "Urządzenia peryferyjne"
    entries[1].course_type.should == "L"
    entries[1].group_code.should == "E00-75c"
    entries[1].lecturer.should == "Dr inż. Jacek Mazurkiewicz"
    entries[1].week_day.should == 0
    entries[1].week.should == 1
    entries[1].start_hour.should == 11
    entries[1].start_min.should == 15
    entries[1].end_hour.should == 14
    entries[1].end_min.should == 0
    entries[1].building.should == "C-3"
    entries[1].room.should == "229"

    entries[2].course_code.should == "INEK00010L"
    entries[2].course_name.should == "Projektowanie efektywnych ..."
    entries[2].course_type.should == "L"
    entries[2].group_code.should == "E00-64o"
    entries[2].lecturer.should == "Mgr inż. Piotr Spędzia"
    entries[2].week_day.should == 0
    entries[2].week.should == 1
    entries[2].start_hour.should == 15
    entries[2].start_min.should == 15
    entries[2].end_hour.should == 16
    entries[2].end_min.should == 55
    entries[2].building.should == "C-3"
    entries[2].room.should == "104"

    entries[3].course_code.should == "INEK00014P"
    entries[3].course_name.should == "Technologie sieciowe 2"
    entries[3].course_type.should == "P"
    entries[3].group_code.should == "E00-73h"
    entries[3].lecturer.should == "Dr hab. inż. Michał Woźniak"
    entries[3].week_day.should == 0
    entries[3].week.should == 2
    entries[3].start_hour.should == 17
    entries[3].start_min.should == 5
    entries[3].end_hour.should == 18
    entries[3].end_min.should == 45
    entries[3].building.should == "C-3"
    entries[3].room.should == "114"

    entries[4].course_code.should == "INEK00013S"
    entries[4].course_name.should == "Bazy danych 2"
    entries[4].course_type.should == "S"
    entries[4].group_code.should == "E00-71d"
    entries[4].lecturer.should == "Dr inż. Piotr Patronik"
    entries[4].week_day.should == 0
    entries[4].week.should == 2
    entries[4].start_hour.should == 18
    entries[4].start_min.should == 55
    entries[4].end_hour.should == 20
    entries[4].end_min.should == 35
    entries[4].building.should == "C-3"
    entries[4].room.should == "20"

    entries[5].course_code.should == "INEK00010W"
    entries[5].course_name.should == "Projektowanie efektywnych ..."
    entries[5].course_type.should == "W"
    entries[5].group_code.should == "E00-66c"
    entries[5].lecturer.should == "Dr inż. Tomasz Krysiak"
    entries[5].week_day.should == 1
    entries[5].week.should == 0
    entries[5].start_hour.should == 13
    entries[5].start_min.should == 15
    entries[5].end_hour.should == 15
    entries[5].end_min.should == 0
    entries[5].building.should == "C-1"
    entries[5].room.should == "201"

    entries[6].course_code.should == "INEK00012W"
    entries[6].course_name.should == "Grafika komp.i kom.człow.-komp"
    entries[6].course_type.should == "W"
    entries[6].group_code.should == "E00-70a"
    entries[6].lecturer.should == "Dr inż. Jacek Jarnicki"
    entries[6].week_day.should == 1
    entries[6].week.should == 0
    entries[6].start_hour.should == 15
    entries[6].start_min.should == 15
    entries[6].end_hour.should == 17
    entries[6].end_min.should == 0
    entries[6].building.should == "C-1"
    entries[6].room.should == "201"

    entries[7].course_code.should == "INEK00012L"
    entries[7].course_name.should == "Grafika kom.i kom.człow.-komp."
    entries[7].course_type.should == "L"
    entries[7].group_code.should == "E00-69j"
    entries[7].lecturer.should == "Dr inż. Katarzyna Nowak"
    entries[7].week_day.should == 1
    entries[7].week.should == 2
    entries[7].start_hour.should == 10
    entries[7].start_min.should == 15
    entries[7].end_hour.should == 13
    entries[7].end_min.should == 0
    entries[7].building.should == "C-3"
    entries[7].room.should == "127L"

    entries[8].course_code.should == "INEK00016W"
    entries[8].course_name.should == "Systemy operacyjne 1"
    entries[8].course_type.should == "W"
    entries[8].group_code.should == "E00-77d"
    entries[8].lecturer.should == "Dr inż. Dariusz Caban"
    entries[8].week_day.should == 2
    entries[8].week.should == 0
    entries[8].start_hour.should == 7
    entries[8].start_min.should == 30
    entries[8].end_hour.should == 9
    entries[8].end_min.should == 0
    entries[8].building.should == "C-1"
    entries[8].room.should == "201"

    entries[9].course_code.should == "INEK00011L"
    entries[9].course_name.should == "Inżynieria oprogramowania"
    entries[9].course_type.should == "L"
    entries[9].group_code.should == "E00-67m"
    entries[9].lecturer.should == "Dr inż. Paweł Skrobanek"
    entries[9].week_day.should == 3
    entries[9].week.should == 0
    entries[9].start_hour.should == 15
    entries[9].start_min.should == 15
    entries[9].end_hour.should == 17
    entries[9].end_min.should == 0
    entries[9].building.should == "C-3"
    entries[9].room.should == "05"

    entries[10].course_code.should == "INEK00013P"
    entries[10].course_name.should == "Bazy danych 2"
    entries[10].course_type.should == "P"
    entries[10].group_code.should == "E03-46l"
    entries[10].lecturer.should == "Mgr inż. Andrzej Wytyczak-Partyka"
    entries[10].week_day.should == 3
    entries[10].week.should == 0
    entries[10].start_hour.should == 17
    entries[10].start_min.should == 5
    entries[10].end_hour.should == 18
    entries[10].end_min.should == 45
    entries[10].building.should == "C-3"
    entries[10].room.should == "013"

    entries[11].course_code.should == "INEK00014L"
    entries[11].course_name.should == "Technologie sieciowe 2"
    entries[11].course_type.should == "L"
    entries[11].group_code.should == "E00-72k"
    entries[11].lecturer.should == "Dr inż. Arkadiusz Grzybowski"
    entries[11].week_day.should == 3
    entries[11].week.should == 1
    entries[11].start_hour.should == 18
    entries[11].start_min.should == 55
    entries[11].end_hour.should == 20
    entries[11].end_min.should == 35
    entries[11].building.should == "C-3"
    entries[11].room.should == "126"

    entries[12].course_code.should == "INEK00010P"
    entries[12].course_name.should == "Projektowanie efektywnych ..."
    entries[12].course_type.should == "P"
    entries[12].group_code.should == "E00-65n"
    entries[12].lecturer.should == "Prof. dr hab. inż. Adam Janiak"
    entries[12].week_day.should == 3
    entries[12].week.should == 2
    entries[12].start_hour.should == 18
    entries[12].start_min.should == 55
    entries[12].end_hour.should == 20
    entries[12].end_min.should == 35
    entries[12].building.should == "C-3"
    entries[12].room.should == "312"

    entries[13].course_code.should == "INEK00011W"
    entries[13].course_name.should == "Inżynieria oprogramowania"
    entries[13].course_type.should == "W"
    entries[13].group_code.should == "E00-68a"
    entries[13].lecturer.should == "Prof. dr hab. inż. Jan Magott"
    entries[13].week_day.should == 4
    entries[13].week.should == 0
    entries[13].start_hour.should == 11
    entries[13].start_min.should == 15
    entries[13].end_hour.should == 13
    entries[13].end_min.should == 0
    entries[13].building.should == "C-1"
    entries[13].room.should == "205"

    entries[14].course_code.should == "INEK00017W"
    entries[14].course_name.should == "Układy cyfr. i sys.wbud.1"
    entries[14].course_type.should == "W"
    entries[14].group_code.should == "E00-79a"
    entries[14].lecturer.should == "Dr inż. Jan Nikodem"
    entries[14].week_day.should == 4
    entries[14].week.should == 0
    entries[14].start_hour.should == 13
    entries[14].start_min.should == 15
    entries[14].end_hour.should == 15
    entries[14].end_min.should == 0
    entries[14].building.should == "C-1"
    entries[14].room.should == "205"

    entries[15].course_code.should == "INEK00017L"
    entries[15].course_name.should == "Układy cyfr. i sys.wbud.1"
    entries[15].course_type.should == "L"
    entries[15].group_code.should == "E00-78o"
    entries[15].lecturer.should == "Dr inż. Jacek Majewski"
    entries[15].week_day.should == 4
    entries[15].week.should == 0
    entries[15].start_hour.should == 15
    entries[15].start_min.should == 15
    entries[15].end_hour.should == 18
    entries[15].end_min.should == 0
    entries[15].building.should == "C-3"
    entries[15].room.should == "016"

    entries[16].course_code.should == "INEK00014W"
    entries[16].course_name.should == "Technologie sieciowe 2"
    entries[16].course_type.should == "W"
    entries[16].group_code.should == "E00-74a"
    entries[16].lecturer.should == "Dr hab. inż. Michał Woźniak"
    entries[16].week_day.should == 4
    entries[16].week.should == 1
    entries[16].start_hour.should == 9
    entries[16].start_min.should == 15
    entries[16].end_hour.should == 11
    entries[16].end_min.should == 0
    entries[16].building.should == "C-1"
    entries[16].room.should == "205"

    entries[17].course_code.should == "INEK00015W"
    entries[17].course_name.should == "Urządzenia peryferyjne"
    entries[17].course_type.should == "W"
    entries[17].group_code.should == "E00-76a"
    entries[17].lecturer.should == "Dr inż. Maciej Nikodem"
    entries[17].week_day.should == 4
    entries[17].week.should == 2
    entries[17].start_hour.should == 9
    entries[17].start_min.should == 15
    entries[17].end_hour.should == 11
    entries[17].end_min.should == 0
    entries[17].building.should == "C-1"
    entries[17].room.should == "205"
  end
end
