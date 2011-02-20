require 'spec_helper'

describe Schedule do
  
  describe "color schemes" do
    it "should create default color schemes" do
      schedule = Schedule.create
      schedule.color_schemes.reload.size.should == 6
    end
  end
end
