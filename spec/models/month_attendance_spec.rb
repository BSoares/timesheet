require "rails_helper"

RSpec.describe MonthAttendance do
  subject(:month_attendance) { build(:month_attendance) }

  describe "Validations" do
    describe "employee" do
      it "should not be blank" do
        month_attendance.employee = nil

        month_attendance.valid?

        expect(month_attendance.errors.keys).to include :employee
      end
    end

    describe "month" do
      it "should not be blank" do
        month_attendance.month = nil

        month_attendance.valid?

        expect(month_attendance.errors.keys).to include :month
      end

      it "should not accept invalid date" do
        month_attendance.month = "xxx"

        month_attendance.valid?

        expect(month_attendance.errors.keys).to include :month
      end
    end
  end
end
