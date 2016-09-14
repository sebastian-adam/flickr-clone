class Account < ApplicationRecord
  validates_presence_of :first_name, :last_name
  has_and_belongs_to_many :posts
  belongs_to :user
end
