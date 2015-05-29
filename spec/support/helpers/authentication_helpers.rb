module AuthenticationHelpers
  def login_with(user)
    visit root_path

    click_on t("sessions.new.title")

    fill_form :session,
      email: user.email,
      password: user.password

    click_button t("sessions.new.submit")
  end
end

RSpec.configure do |config|
  config.include AuthenticationHelpers, type: :feature
end
