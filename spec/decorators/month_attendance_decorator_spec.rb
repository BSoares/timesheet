require "rails_helper"

RSpec.describe "MonthAttendanceDecorator" do
  let(:month_attendance) do
    MonthAttendanceDecorator.decorate(
      build(:month_attendance, month: "01/10/1985"))
  end

  context "month_formatted" do
    specify "returns the sum of attendances time formatted" do
      expect(month_attendance.month_formatted).to eql "Outubro / 1985"
    end
  end

  context "total_time" do
    specify "returns the sum of attendances time formatted" do
      expect(month_attendance.total_time).to eql "18:00"
    end
  end
end
