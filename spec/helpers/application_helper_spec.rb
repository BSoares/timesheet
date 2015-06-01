require "rails_helper"

RSpec.feature "ApplicationHelper" do
  include ApplicationHelper

  context "datetime_to_time" do
    it "convert DateTime in time text without seconds" do
      time_text = datetime_to_time(DateTime.new(1900, 1, 1, 17, 35, 59))

      expect(time_text).to eql "17:35"
    end
  end

  context "seconds_to_time" do
    it "convert seconds in hour time format (ex.: 13:30 or 42:12)" do
      two_hours_seconds = 60 * 60 * 2

      hour_text = seconds_to_time(two_hours_seconds)

      expect(hour_text).to eql "02:00"

      seconds = 60 * 60 * 42 + 12 * 60

      hour_text = seconds_to_time(seconds)

      expect(hour_text).to eql "42:12"
    end
  end
end
