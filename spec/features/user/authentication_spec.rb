require "rails_helper"

RSpec.feature "User Authentication" do
  let!(:user) { create(:user) }

  before do
    visit root_path

    click_on t("sessions.new.title")
  end

  scenario "with an existing user" do
    fill_form :session,
      email: user.email,
      password: user.password

    click_button t("sessions.new.submit")

    expect(page).to have_content user.name
  end

  scenario "with a nonexistent user" do
    fill_form :session,
      email: "xxx",
      password: "xxx"

    click_button t("sessions.new.submit")

    expect(page).to have_content t("sessions.create.flash.invalid_credentials")
  end
end
