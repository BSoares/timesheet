require "rails_helper"

RSpec.describe Attendance do
  subject(:attendance) { create(:attendance) }

  describe "Validations" do
    describe "employee" do
      it { is_expected.to validate_presence_of(:employee) }
    end

    describe "day" do
      it { is_expected.to validate_presence_of(:day) }
      it do
        is_expected.to validate_uniqueness_of(:day).scoped_to(:employee_id)
      end
    end

    describe "entrance_at" do
      it { is_expected.to validate_presence_of(:entrance_at) }

      it "should be in the same day that day property is" do
        attendance = build(:attendance)
        attendance.day = Date.new(1985, 10, 19)
        attendance.entrance_at = DateTime.new(1985, 10, 20, 8, 0, 0)

        attendance.save

        expect(attendance.errors.keys).to include :entrance_at
      end
    end

    describe "departure_at" do
      it "should be greater than entrance_at" do
        attendance = build(:attendance)
        attendance.entrance_at = DateTime.new(1985, 10, 19, 8, 0, 0)
        attendance.departure_at = DateTime.new(1985, 10, 19, 7, 0, 0)

        attendance.save

        expect(attendance.errors.keys).to include :departure_at
      end

      it "should be in the same day that day property is" do
        attendance = build(:attendance)
        attendance.day = Date.new(1985, 10, 19)
        attendance.departure_at = DateTime.new(1985, 10, 20, 17, 0, 0)

        attendance.save

        expect(attendance.errors.keys).to include :departure_at
      end
    end
  end
end
