require 'rails_helper'

describe "the new user signup path" do
  it "creates a new user and account" do
    visit root_path
    click_on "Sign Up"
    fill_in "Email", :with => "test1@test.com"
    fill_in "User name", :with => "Steven"
    fill_in "user_password", :with => "654321"
    fill_in "user_password_confirmation", :with => "654321"
    click_button "Sign up"
    expect(page).to have_content "Welcome! You have signed up successfully."
    fill_in "First name", :with => "Steve"
    fill_in "Last name", :with => "Treve"
    click_button "Create Account"
    expect(page).to have_content "Thanks for creating an account."
  end

  it "fails to create new user if fields are blank" do
    visit root_path
    click_on "Sign Up"
    click_button "Sign up"
    expect(page).to have_content "Please review the problems below:"
  end

  it "fails to create new account if fields are blank" do
    visit root_path
    click_on "Sign Up"
    fill_in "Email", :with => "test1@test.com"
    fill_in "User name", :with => "Steven"
    fill_in "user_password", :with => "654321"
    fill_in "user_password_confirmation", :with => "654321"
    click_button "Sign up"
    expect(page).to have_content "Welcome! You have signed up successfully."
    click_button "Create Account"
    expect(page).to have_content "can't be blank"
  end
end
