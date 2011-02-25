require 'spec_helper'

describe Schedule do
  before(:each) do
    @schedule = Schedule.create
  end
  
  describe "color schemes" do
    it "should create default color schemes" do
      @schedule.color_schemes.size.should == 6
    end
    
    it "should set new color scheme" do
      @schedule.set_color_scheme(:bw)
      @schedule.color_schemes.size.should == 6
      @schedule.color_schemes.each do |cs|
        cs.background.should == "#fff"
        cs.border.should == "#000"
        cs.font.should == "#000"
      end
    end
  end


  it "should create slug" do
    @schedule.slug.should_not be_blank
  end
  
  it "should return correct semester name" do
    @schedule.semester = 1
    @schedule.semester_name.should == "Zimowy"
    
    @schedule.semester = 2
    @schedule.semester_name.should == "Letni"
  end
end
