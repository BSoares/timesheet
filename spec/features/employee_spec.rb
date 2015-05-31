require "rails_helper"

RSpec.feature "Employee" do
  let(:user) { create(:user) }

  context "signed in user" do
    specify "can see link to Employee CRUD" do
      login_with user

      visit root_path

      expect(page).to have_link "Funcionários"
    end
  end

  context "unsigned in user" do
    specify "can not see link to Employee CRUD" do
      visit root_path

      expect(page).to_not have_link "Funcionários"
    end
  end

  context "create" do
    scenario "without signed in user" do
      visit new_employee_url

      expect(current_path).to eql login_path
    end

    scenario "with signed in user" do
      login_with user

      visit new_employee_path

      expect(current_path).to eql new_employee_path
    end

    scenario "with valid params" do
      login_with user

      click_link t("employees.index.title")

      click_link t("employees.new.title")

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

      click_link t("employees.index.title")

      click_link t("employees.new.title")

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

  context "list" do
    specify "has employees listed" do
      login_with user

      employee = create(:employee)

      click_link t("employees.index.title")

      expect(page).to have_content employee.name
    end
  end

  context "edit" do
    scenario "with valid params" do
      login_with user

      employee = create(:employee)

      click_link t("employees.index.title")

      click_link t("employees.edit.title", name: employee.name)

      employee2 = build(:employee)

      fill_form :employee,
        cpf: employee2.cpf,
        name: employee2.name

      submit_form

      expect(page).to have_content t("employees.update.flash.success")

      edited_employee = Employee.first

      expect(edited_employee.cpf).to eql employee2.cpf
      expect(edited_employee.name).to eql employee2.name
    end

    scenario "with invalid params" do
      login_with user

      employee = create(:employee)

      click_link t("employees.index.title")

      click_link t("employees.edit.title", name: employee.name)

      fill_form :employee,
        cpf: "",
        name: ""

      submit_form

      expect(page).to have_content t("employees.update.flash.error")
    end

    def submit_form
      click_button t("helpers.submit.update",
        model: t("activerecord.models.employee.one"))
    end
  end
end
