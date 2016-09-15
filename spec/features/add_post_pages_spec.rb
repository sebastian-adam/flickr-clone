require 'rails_helper'

describe "the add a post process" do
  it "creates a post" do
    user = FactoryGirl.create(:confirmed_user)
    account = FactoryGirl.create(:account)
    account.user_id = user.id
    login_as(user, :scope => :user)
    visit root_path
    click_on "Create"
    attach_file("Image", 'spec/fixtures/images/Sienna.jpg')
    fill_in 'Location', :with => 'Portland'
    fill_in 'Caption', :with => 'test caption'
    click_on "Create Post"
    expect(page).to have_content "Portland"
  end

  it "fails if it's missing parameters" do
    user = FactoryGirl.create(:confirmed_user)
    login_as(user, :scope => :user)
    visit root_path
    click_on "Create"
    click_on "Create Post"
    expect(page).to have_content "Imagecan't be blank"
  end
end
