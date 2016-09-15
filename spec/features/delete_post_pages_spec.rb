require 'rails_helper'

describe "the edit a post process" do
  it "edits a post" do
    user = FactoryGirl.create(:confirmed_user)
    account = FactoryGirl.create(:account)
    account.user_id = user.id
    login_as(user, :scope => :user)
    post = FactoryGirl.create(:post)
    visit post_path(post)
    click_on "Delete"
    expect(page).to have_content "There are no pictures. Upload one!"
  end
end
