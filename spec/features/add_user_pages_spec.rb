require 'rails_helper'

describe "the new user signup path" do
  it "creates a new user" do
    visit root_path
    click_on "Sign Up"
    fill_in "Email", :with => "test1@test.com"
    fill_in "User name", :with => "Steven"
    fill_in "user_password", :with => "654321"
    fill_in "user_password_confirmation", :with => "654321"
    click_button "Sign up"
    expect(page).to have_content "A message with a confirmation link has been sent to your email address. Please follow the link to activate your account."
  end

  it "fails to create new user if fields are blank" do
    visit root_path
    click_on "Sign Up"
    click_button "Sign up"
    expect(page).to have_content "Please review the problems below:"
  end

  it "fails to create new account if fields are blank" do
    user = FactoryGirl.create(:confirmed_user)
    login_as(user, :scope => :user)
    visit new_account_path
    click_button "Create Account"
    expect(page).to have_content "can't be blank"
  end
end
