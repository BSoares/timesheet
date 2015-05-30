require "rails_helper"

RSpec.feature "Employee" do
  let(:user) { create(:user) }

  context "creation" do
    scenario "without signed in user" do
      visit new_employee_url

      expect(current_path).to eql(login_path)
    end

    scenario "with signed in user" do
      login_with user

      visit new_employee_path

      expect(current_path).to eql(new_employee_path)
    end

    scenario "with valid params" do
      login_with user

      visit new_employee_path

      employee = build(:employee)

      fill_form :employee,
        cpf: employee.cpf,
        name: employee.name

      submit_form

      expect(page).to have_content t("employees.create.flash.success")

      created_employee = Employee.first

      expect(created_employee.cpf).to eql employee.cpf
      expect(created_employee.name).to eql employee.name
    end

    scenario "with invalid params" do
      login_with user

      visit new_employee_path

      fill_form :employee,
        cpf: "",
        name: ""

      submit_form

      expect(page).to have_content t("employees.create.flash.error")

      created_employee = Employee.first

      expect(created_employee).to be nil
    end

    def submit_form
      click_button t("helpers.submit.create",
        model: t("activerecord.models.employee.one"))
    end
  end
end
