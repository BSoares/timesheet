require "rails_helper"

RSpec.feature "User Authentication" do
  let!(:user) { create(:user) }
  let(:invalid_user) { build(:user, email: "xxx", password: "xxx") }

  scenario "with an existing user" do
    login_with user

    expect(page).to have_content user.name
  end

  scenario "with a nonexistent user" do
    login_with invalid_user

    expect(page).to have_content t("sessions.create.flash.invalid_credentials")
  end

  scenario "sign out" do
    login_with user

    click_on t("sessions.destroy.title")

    expect(page).to_not have_content user.name
  end
end
