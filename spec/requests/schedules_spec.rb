require 'spec_helper'

describe "Schedules" do
  describe "GET /schedules" do
    it "works" do
      visit root_path
      response.status.should be(200)
    end
  end
end
