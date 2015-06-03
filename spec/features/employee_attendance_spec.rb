require "rails_helper"

RSpec.feature "Employee Attendance" do
  context "create" do
    let(:employee) { create(:employee) }

    scenario "entrance with existent employee" do
      visit root_path

      post_attendance_with employee.cpf

      expect(page).to have_content(
        t("attendances.create.flash.success_entrance"))

      attendance_created = Attendance.first

      expect(attendance_created.employee).to eql employee
      expect(attendance_created.day).to eql DateTime.now.to_date
      expect(attendance_created.entrance_at).to be_truthy
      expect(attendance_created.departure_at).to be_nil
    end

    scenario "with database error during save" do
      visit root_path

      allow_any_instance_of(Attendance).to receive(:save).and_return(false)

      post_attendance_with employee.cpf

      expect(page).to have_content t("attendances.create.flash.error_entrance")
    end

    scenario "exit with existent employee" do
      visit root_path

      Timecop.travel Time.new(1985, 10, 19, 8, 0, 10) do
        post_attendance_with employee.cpf
      end

      attendance_created = Attendance.first

      entrance_time = attendance_created.entrance_at.strftime("%H:%M")

      expect(attendance_created.employee).to eql employee
      expect(attendance_created.day).to eql DateTime.new(1985, 10, 19)
      expect(entrance_time).to eql "08:00"
      expect(attendance_created.departure_at).to be_nil

      Timecop.travel Time.new(1985, 10, 19, 17, 0, 20) do
        post_attendance_with employee.cpf
      end

      attendance_updated = Attendance.first

      worked_seconds = (attendance_updated.departure_at -
        attendance_updated.entrance_at)
      worked_time = Time.at(worked_seconds).utc.strftime("%H:%M")

      expect(worked_time).to eql "09:00"

      departure_time = attendance_updated.departure_at.strftime("%H:%M")

      expect(departure_time).to eql "17:00"
    end

    context "exit two times" do
      specify "show an error message" do
        visit root_path

        Timecop.travel Time.new(1985, 10, 19, 8, 0, 0) do
          post_attendance_with employee.cpf
        end

        Timecop.travel Time.new(1985, 10, 19, 17, 0, 0) do
          post_attendance_with employee.cpf
        end

        Timecop.travel Time.new(1985, 10, 19, 17, 10, 0) do
          post_attendance_with employee.cpf
        end

        expect(page).to have_content(
          t("attendances.create.flash.already_registered"))
      end
    end

    scenario "entrance with an inexistent employee" do
      visit root_path

      post_attendance_with "xxx"

      expect(page).to have_content(
        t("attendances.create.flash.employee_not_found"))

      expect(Attendance.first).to be_nil
    end

    def post_attendance_with(employee_cpf)
      fill_form :attendance,
        employee_cpf: employee_cpf

      click_button t("home.home.submit")
    end
  end
end
