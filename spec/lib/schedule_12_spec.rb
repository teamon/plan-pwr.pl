# encoding: utf-8
require 'spec_helper'


describe "Schedule 12" do
  it "should work" do
    schedule, entries = parse_schedule 12
    schedule.should be_valid

    schedule.year.should == "2013/2014"
    schedule.semester.should == Epure::Config::SUMMER

    entries.size.should == 15

    entries[0].course_code.should == 'INZ003569L'
    entries[0].course_name.should == 'Progr. sys.mobilnych-iOS Apple'
    entries[0].course_type.should == 'L'
    entries[0].group_code.should == 'Z00-97b'
    entries[0].lecturer.should == 'Dr inż. Krzysztof Waśko'
    entries[0].week_day.should == 0
    entries[0].week.should == 0
    entries[0].start_hour.should == 13
    entries[0].start_min.should == 15
    entries[0].end_hour.should == 15
    entries[0].end_min.should == 00
    entries[0].building.should == 'C-6'
    entries[0].room.should == '130'

    entries[1].course_code.should == 'INZ004591W'
    entries[1].course_name.should == 'Elementy zarz. projektami inf.'
    entries[1].course_type.should == 'W'
    entries[1].group_code.should == 'Z01-49a'
    entries[1].lecturer.should == 'Dr inż. Iwona Dubielewicz'
    entries[1].week_day.should == 0
    entries[1].week.should == 0
    entries[1].start_hour.should == 15
    entries[1].start_min.should == 15
    entries[1].end_hour.should == 16
    entries[1].end_min.should == 55
    entries[1].building.should == 'A-1'
    entries[1].room.should == '329'

    entries[2].course_code.should == 'INZ001721W'
    entries[2].course_name.should == 'Zaawans. technologie webowe'
    entries[2].course_type.should == 'W'
    entries[2].group_code.should == 'Z00-77b'
    entries[2].lecturer.should == 'Dr inż. Ziemowit Nowak'
    entries[2].week_day.should == 0
    entries[2].week.should == 0
    entries[2].start_hour.should == 17
    entries[2].start_min.should == 05
    entries[2].end_hour.should == 18
    entries[2].end_min.should == 45
    entries[2].building.should == 'C-3'
    entries[2].room.should == '22'

    entries[3].course_code.should == 'INZ003545L'
    entries[3].course_name.should == 'Sztuczna intelig. i inż.wiedzy'
    entries[3].course_type.should == 'L'
    entries[3].group_code.should == 'Z01-47j'
    entries[3].lecturer.should == 'Dr inż. Paweł Myszkowski'
    entries[3].week_day.should == 0
    entries[3].week.should == 0
    entries[3].start_hour.should == 18
    entries[3].start_min.should == 55
    entries[3].end_hour.should == 20
    entries[3].end_min.should == 35
    entries[3].building.should == 'D-2'
    entries[3].room.should == '127c'

    entries[4].course_code.should == 'INZ001708W'
    entries[4].course_name.should == 'Hurtownie danych'
    entries[4].course_type.should == 'W'
    entries[4].group_code.should == 'Z01-42a'
    entries[4].lecturer.should == 'Dr inż. Lech Tuzinkiewicz'
    entries[4].week_day.should == 0
    entries[4].week.should == 2
    entries[4].start_hour.should == 11
    entries[4].start_min.should == 15
    entries[4].end_hour.should == 13
    entries[4].end_min.should == 00
    entries[4].building.should == 'A-1'
    entries[4].room.should == '329'

    entries[5].course_code.should == 'INZ001709W'
    entries[5].course_name.should == 'Bezpieczeństwo i ochr. danych'
    entries[5].course_type.should == 'W'
    entries[5].group_code.should == 'Z01-44a'
    entries[5].lecturer.should == 'Dr inż. Grzegorz Kołaczek'
    entries[5].week_day.should == 1
    entries[5].week.should == 0
    entries[5].start_hour.should == 13
    entries[5].start_min.should == 15
    entries[5].end_hour.should == 15
    entries[5].end_min.should == 00
    entries[5].building.should == 'A-1'
    entries[5].room.should == '329'

    entries[6].course_code.should == 'INZ001721L'
    entries[6].course_name.should == 'Zaawans. technologie webowe'
    entries[6].course_type.should == 'L'
    entries[6].group_code.should == 'Z00-76d'
    entries[6].lecturer.should == 'Mgr inż. Łukasz Falas'
    entries[6].week_day.should == 1
    entries[6].week.should == 1
    entries[6].start_hour.should == 18
    entries[6].start_min.should == 55
    entries[6].end_hour.should == 20
    entries[6].end_min.should == 35
    entries[6].building.should == 'D-2'
    entries[6].room.should == '127c'

    entries[7].course_code.should == 'INZ003569W'
    entries[7].course_name.should == 'Progr. sys.mobilnych-iOS Apple'
    entries[7].course_type.should == 'W'
    entries[7].group_code.should == 'Z00-98b'
    entries[7].lecturer.should == 'Dr inż. Krzysztof Waśko'
    entries[7].week_day.should == 1
    entries[7].week.should == 2
    entries[7].start_hour.should == 15
    entries[7].start_min.should == 15
    entries[7].end_hour.should == 16
    entries[7].end_min.should == 55
    entries[7].building.should == 'C-7'
    entries[7].room.should == '201'

    entries[8].course_code.should == 'INZ003545W'
    entries[8].course_name.should == 'Sztuczna intelig. i inż.wiedzy'
    entries[8].course_type.should == 'W'
    entries[8].group_code.should == 'Z01-48a'
    entries[8].lecturer.should == 'Prof. dr hab. inż. Halina Kwaśnicka'
    entries[8].week_day.should == 3
    entries[8].week.should == 0
    entries[8].start_hour.should == 11
    entries[8].start_min.should == 15
    entries[8].end_hour.should == 13
    entries[8].end_min.should == 00
    entries[8].building.should == 'A-1'
    entries[8].room.should == '329'

    entries[9].course_code.should == 'INZ001708L'
    entries[9].course_name.should == 'Hurtownie danych'
    entries[9].course_type.should == 'L'
    entries[9].group_code.should == 'Z01-41k'
    entries[9].lecturer.should == 'Dr inż. Lech Tuzinkiewicz'
    entries[9].week_day.should == 3
    entries[9].week.should == 0
    entries[9].start_hour.should == 17
    entries[9].start_min.should == 05
    entries[9].end_hour.should == 18
    entries[9].end_min.should == 45
    entries[9].building.should == 'D-2'
    entries[9].room.should == '107a'

    entries[10].course_code.should == 'INZ001710W'
    entries[10].course_name.should == 'Rozproszone sys. informatyczne'
    entries[10].course_type.should == 'W'
    entries[10].group_code.should == 'Z01-46a'
    entries[10].lecturer.should == 'Dr inż. Mariusz Fraś'
    entries[10].week_day.should == 4
    entries[10].week.should == 0
    entries[10].start_hour.should == 9
    entries[10].start_min.should == 15
    entries[10].end_hour.should == 11
    entries[10].end_min.should == 00
    entries[10].building.should == 'A-1'
    entries[10].room.should == '329'

    entries[11].course_code.should == 'JZL016010C'
    entries[11].course_name.should == 'Język rosyjski - A1'
    entries[11].course_type.should == 'C'
    entries[11].group_code.should == 'L00-57c'
    entries[11].lecturer.should == 'Mgr Tatiana Studentowa'
    entries[11].week_day.should == 2
    entries[11].week.should == 0
    entries[11].start_hour.should == 07
    entries[11].start_min.should == 30
    entries[11].end_hour.should == 9
    entries[11].end_min.should == 00
    entries[11].building.should == 'H-4'
    entries[11].room.should == '205'

    entries[12].course_code.should == 'JZL016010C'
    entries[12].course_name.should == 'Język rosyjski - A1'
    entries[12].course_type.should == 'C'
    entries[12].group_code.should == 'L00-57c'
    entries[12].lecturer.should == 'Mgr Tatiana Studentowa'
    entries[12].week_day.should == 4
    entries[12].week.should == 0
    entries[12].start_hour.should == 17
    entries[12].start_min.should == 05
    entries[12].end_hour.should == 18
    entries[12].end_min.should == 35
    entries[12].building.should == 'H-4'
    entries[12].room.should == '205'

    entries[13].course_code.should == 'INZ001710L'
    entries[13].course_name.should == 'Rozproszone sys. informatyczne'
    entries[13].course_type.should == 'L'
    entries[13].group_code.should == 'Z01-45f'
    entries[13].lecturer.should == 'Dr inż. Anna Kamińska-Chuchmała'
    entries[13].week_day.should == 1
    entries[13].week.should == 2
    entries[13].start_hour.should == 17
    entries[13].start_min.should == 05
    entries[13].end_hour.should == 18
    entries[13].end_min.should == 45
    entries[13].building.should == 'C-6'
    entries[13].room.should == '130'

    entries[14].course_code.should == 'INZ001709L'
    entries[14].course_name.should == 'Bezpieczeństwo i ochr. danych'
    entries[14].course_type.should == 'L'
    entries[14].group_code.should == 'Z01-43j'
    entries[14].lecturer.should == 'Dr inż. Teresa Mendyk-Krajewska'
    entries[14].week_day.should == 2
    entries[14].week.should == 2
    entries[14].start_hour.should == 17
    entries[14].start_min.should == 05
    entries[14].end_hour.should == 18
    entries[14].end_min.should == 45
    entries[14].building.should == 'C-6'
    entries[14].room.should == '130'
  end
end
