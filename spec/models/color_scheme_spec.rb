# encoding: utf-8

require 'spec_helper'

describe ColorScheme do
  it "should respond with correct name" do
    cs = ColorScheme.new
    cs.course_type = "W"
    cs.name.should == "Wykład"

    cs = ColorScheme.new
    cs.course_type = "P"
    cs.name.should == "Projekt"
  end
end
