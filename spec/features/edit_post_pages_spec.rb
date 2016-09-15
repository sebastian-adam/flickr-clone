require 'rails_helper'

describe "the edit a post process" do
  it "edits a post" do
    user = FactoryGirl.create(:confirmed_user)
    account = FactoryGirl.create(:account)
    account.user_id = user.id
    login_as(user, :scope => :user)
    post = FactoryGirl.create(:post)
    visit edit_post_path(post)
    fill_in 'Location', :with => 'Beavertron'
    click_button "Update Post"
    expect(page).to have_content "i follow you Beavertron"
  end

  it "fails if it's missing parameters" do
    user = FactoryGirl.create(:confirmed_user)
    account = FactoryGirl.create(:account)
    account.user_id = user.id
    login_as(user, :scope => :user)
    post = FactoryGirl.create(:post)
    visit edit_post_path(post)
    fill_in 'Location', :with => ''
    click_button "Update Post"
    expect(page).to have_content "Locationcan't be blank"
  end
end
