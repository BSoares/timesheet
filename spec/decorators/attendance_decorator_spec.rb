require "rails_helper"

RSpec.describe "AttendanceDecorator" do
  let(:attendance) { build(:attendance).decorate }
  let(:completed_attendance) { build(:attendance, :completed).decorate }

  context "total" do
    specify "returns the sum of entrance and departure in time format" do
      expect(completed_attendance.total).to eql "09:00"
    end

    specify "returns a '-' when departure is not set" do
      expect(attendance.total).to eql "-"
    end
  end

  context "entrance_time" do
    specify "returns entrance_at formatted" do
      expect(attendance.entrance_time).to eql "08:00"
    end
  end

  context "departure_time" do
    specify "returns departure_at formatted" do
      expect(completed_attendance.departure_time).to eql "17:00"
    end

    specify "returns 'without departure' text when is not set" do
      expect(attendance.departure_time).to eql(
        t("month_attendances.show.without_departure"))
    end
  end
end
