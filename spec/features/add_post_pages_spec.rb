require 'rails_helper'

describe "the add a post process" do
  it "creates a post" do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_on 'Log in'
    click_on "Create"
    attach_file("Image", 'spec/fixtures/images/Sienna.jpg')
    fill_in 'Location', :with => 'Portland'
    fill_in 'Caption', :with => 'test caption'
    click_on "Create Post"
    expect(page).to have_content "Portland"
  end

  it "fails if it's missing parameters" do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_on 'Log in'
    click_on "Create"
    click_on "Create Post"
    expect(page).to have_content "Imagecan't be blank"
  end
end
