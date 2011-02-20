# encoding: utf-8

require 'spec_helper'

describe Entry do
  describe "validations" do
    before :each do
      @schedule = Schedule.create
      @entry = @schedule.entries.new(
        :course_name => "Kurs", 
        :week => 0,
        :week_day => 0,
        :lecturer => "Lecter",
        :start_hour => 9,
        :start_min => 0,
        :end_hour => 10,
        :end_min => 0
      )
    end
    
    it "should require course name" do
      @entry.course_name = ""
      @entry.should_not be_valid
    end
    
    it "should require correct week" do
      @entry.week = 0
      @entry.should be_valid
      
      @entry.week = 1
      @entry.should be_valid
      
      @entry.week = 2
      @entry.should be_valid
      
      @entry.week = 3
      @entry.should_not be_valid
      
      @entry.week = 5
      @entry.should_not be_valid
    end
    
    it "should require correct week day" do
      @entry.week_day = 0
      @entry.should be_valid
      
      @entry.week_day = 1
      @entry.should be_valid
      
      @entry.week_day = 2
      @entry.should be_valid
      
      @entry.week_day = 3
      @entry.should be_valid
      
      @entry.week_day = 4
      @entry.should be_valid
      
      @entry.week_day = 5
      @entry.should be_valid
      
      @entry.week_day = 6
      @entry.should be_valid
      
      @entry.week_day = 7
      @entry.should_not be_valid
      
      @entry.week_day = -1
      @entry.should_not be_valid
      
      @entry.week_day = 10
      @entry.should_not be_valid
    end
    
    it "should require correct time" do
      @entry.start_hour = 9
      @entry.start_min = 0
      @entry.end_hour = 9
      @entry.end_min = 0
      @entry.should_not be_valid
      
      @entry.start_hour = 9
      @entry.start_min = 0
      @entry.end_hour = 7
      @entry.end_min = 0
      @entry.should_not be_valid
      
      @entry.start_hour = 9
      @entry.start_min = 20
      @entry.end_hour = 9
      @entry.end_min = 10
      @entry.should_not be_valid
      
      @entry.start_hour = 9
      @entry.start_min = 0
      @entry.end_hour = 9
      @entry.end_min = 10
      @entry.should be_valid
      
      @entry.start_hour = 9
      @entry.start_min = 20
      @entry.end_hour = 10
      @entry.end_min = 0
      @entry.should be_valid
    end
    
  end
  
  it "should return correct location" do
    entry = Entry.new(:building => "C-1", :room => "205")
    entry.location.should == "C-1 / 205"
    
    entry = Entry.new(:building => "C-1", :room => "")
    entry.location.should == "C-1"
    
    entry = Entry.new(:building => "", :room => "205")
    entry.location.should == "205"
  end
  
  it "should return correct course name with type" do
    entry = Entry.new(:course_name => "Kurs A", :course_type => "W")
    entry.course_name_with_type.should == "Kurs A (W)"
    
    entry = Entry.new(:course_name => "Inny kurs 123", :course_type => "L")
    entry.course_name_with_type.should == "Inny kurs 123 (L)"
  end
  
  it "should return correct description" do
    entry = Entry.new(:course_code => "INEK0003", :lecturer => "Prof. dr hab. inż Foo Bar")
    entry.description.should == "Prof. dr hab. inż Foo Bar\nINEK0003"
    
    entry = Entry.new(:course_code => "", :lecturer => "Prof. dr hab. inż Foo Bar")
    entry.description.should == "Prof. dr hab. inż Foo Bar"
    
    entry = Entry.new(:course_code => "INEK0003", :lecturer => "")
    entry.description.should == "INEK0003"
    
    entry = Entry.new(:course_code => "", :lecturer => "")
    entry.description.should == ""
  end
  
  it "should return correct week name" do
    entry = Entry.new(:week => 0)
    entry.week_name.should == ""
    
    entry = Entry.new(:week => 1)
    entry.week_name.should == "TN"
    
    entry = Entry.new(:week => 2)
    entry.week_name.should == "TP"
  end

  it "should search lecturers" do
    lecturers = ["Dr hab. inż. Janusz Biernat",
    "Dr hab. inż. Krzysztof Walkowiak",
    "Dr inż. Bożena Chrobot",
    "Dr inż. Jacek Jarnicki",
    "Dr inż. Jacek Mazurkiewicz",
    "Mgr inż. Adam Smutnicki", 
    "Mgr inż. Dariusz Jankowski", 
    "Mgr inż. Karolina Mokrzysz", 
    "Prof. dr hab. inż. Jan Kowalski"]
    
    schedule = Schedule.create
    lecturers.each do |lecturer|
      schedule.entries.create(
        :course_name => "test", 
        :week => 0,
        :week_day => 0,
        :lecturer => lecturer,
        :start_hour => 9,
        :start_min => 0,
        :end_hour => 10,
        :end_min => 0
      )
    end
    
    Entry.search("dr", :lecturer).should include(
      "Dr hab. inż. Janusz Biernat",
      "Dr hab. inż. Krzysztof Walkowiak",
      "Dr inż. Bożena Chrobot",
      "Dr inż. Jacek Jarnicki",
      "Dr inż. Jacek Mazurkiewicz",
      "Mgr inż. Dariusz Jankowski",
      "Prof. dr hab. inż. Jan Kowalski"
    )
    
    Entry.search("prof", :lecturer).should include(
      "Prof. dr hab. inż. Jan Kowalski"
    )
    
    Entry.search("bier", :lecturer).should include(
      "Dr hab. inż. Janusz Biernat",
    )
    
    Entry.search("jacek", :lecturer).should include(
      "Dr inż. Jacek Jarnicki",
      "Dr inż. Jacek Mazurkiewicz",
    )
  end
end
