# encoding: utf-8

require 'spec_helper'

describe Epure::Parser do
  def parse_schedule(n)
    raw = File.read(File.join(File.dirname(__FILE__), "data", "schedule-#{n}.html"))
    schedule = Epure::Parser.parse!(raw)
    entries = schedule.entries
    [schedule, entries]
  end
  
  it "should parse all and give no errors" do
    (1..1).each do |i|
      schedule, entries = parse_schedule i
      # schedule.valid?
      # p schedule.errors
      # p entries.map {|e| e.errors }
      schedule.should be_valid
    end
    
    (1001..1004).each do |i|
      schedule, entries = parse_schedule i
      # schedule.valid?
      # p schedule.errors
      # p entries.map {|e| e.errors }
      schedule.should be_valid
    end
  end
  

end

