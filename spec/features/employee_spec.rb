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

    scenario "with unformatted cpf" do
      login_with user

      click_link t("employees.index.title")

      click_link t("employees.new.title")

      employee = build(:employee)

      fill_form :employee,
        cpf: "25946451766",
        name: employee.name

      submit_form

      created_employee = Employee.first

      expect(created_employee.cpf).to eql "259.464.517-66"
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
    specify "show a message when the list is empty" do
      login_with user

      click_link t("employees.index.title")

      expect(page).to have_content t("employees.index.empty")
    end

    specify "has employees listed" do
      login_with user

      employee = create(:employee)

      click_link t("employees.index.title")

      expect(page).to have_content employee.name
    end
  end

  context "edit" do
    before do
      login_with user

      employee = create(:employee)

      click_link t("employees.index.title")

      click_link t("employees.edit.title", name: employee.name)
    end

    scenario "with valid params" do
      edited_employee = build(:employee, cpf: "228.375.241-82", name: "XXX")

      fill_form :employee,
        cpf: edited_employee.cpf,
        name: edited_employee.name

      submit_form

      expect(page).to have_content t("employees.update.flash.success")

      saved_employee = Employee.first

      expect(saved_employee.cpf).to eql edited_employee.cpf
      expect(saved_employee.name).to eql edited_employee.name
    end

    scenario "with invalid params" do
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

  context "destroy" do
    scenario "ignoring the confirmation dialog" do
      login_with user

      employee = create(:employee)

      click_link t("employees.index.title")

      click_link t("employees.destroy.title", name: employee.name)

      expect(page).to have_content t("employees.destroy.flash.success")
      expect(page).to_not have_content employee.cpf
    end

    scenario "cancel when the method destroy fails and return false" do
      login_with user

      employee = create(:employee)

      click_link t("employees.index.title")

      allow_any_instance_of(Employee).to receive(:destroy).and_return(false)

      click_link t("employees.destroy.title", name: employee.name)

      expect(page).to have_content t("employees.destroy.flash.error")
      expect(page).to have_content employee.cpf
    end

    scenario "canceling from the browser confirmation dialog", js: true do
      login_with user

      employee = create(:employee)

      click_link t("employees.index.title")

      handle_js_confirm false do
        click_link t("employees.destroy.title", name: employee.name)
      end

      expect(page).to_not have_content t("employees.destroy.flash.success")
      expect(page).to have_content employee.cpf
    end

    def handle_js_confirm(accept = true)
      page.evaluate_script "window.original_confirm_function = window.confirm"
      page.evaluate_script "window.confirm = " \
        "function(msg) { return #{accept}; }"
      yield
      page.evaluate_script "window.confirm = window.original_confirm_function"
    end
  end
end
