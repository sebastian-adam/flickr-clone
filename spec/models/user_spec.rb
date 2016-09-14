require 'rails_helper'

describe User do
  [:email, :password, :user_name].each do |attr|
    it {should validate_presence_of(attr)}
  end
  it { should validate_confirmation_of :password }
end
