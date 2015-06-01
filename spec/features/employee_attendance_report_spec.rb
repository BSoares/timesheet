require "rails_helper"

RSpec.feature "Employee Attendance Report" do
  context "generate" do
    let(:user) { create(:user) }

    before "seed database" do
      employee = create(:employee)
      (1..3).each do |n|
        Timecop.travel Time.new(1985, 10, 19) + n.day do
          create(:attendance, :completed, employee: employee)
        end
      end
      (4..5).each do |n|
        Timecop.travel Time.new(1985, 10, 19) + n.day do
          create(:attendance, employee: employee)
        end
      end
    end

    scenario "with valid params" do
      login_with user

      visit root_path

      click_link t("employees.index.title")

      click_link t("month_attendances.new.title")

      fill_form :month_attendance,
        month: "01/10/1985"

      click_on t("month_attendances.new.submit")

      expect(page).to have_content "27:00"

      expect(page).to have_content t("month_attendances.show.without_departure")
    end

    scenario "with invalid month" do
      login_with user

      visit root_path

      click_link t("employees.index.title")

      click_link t("month_attendances.new.title")

      fill_form :month_attendance,
        month: "xxx"

      click_on t("month_attendances.new.submit")

      expect(page).to have_content t("errors.messages.blank")
    end

    scenario "with a date that does not have entries" do
      login_with user

      visit root_path

      click_link t("employees.index.title")

      click_link t("month_attendances.new.title")

      fill_form :month_attendance,
        month: "01/01/1900"

      click_on t("month_attendances.new.submit")

      expect(page).to have_content t("month_attendances.show.attendances_empty")
    end
  end
end
