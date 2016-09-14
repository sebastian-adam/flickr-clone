class Post < ApplicationRecord
  validates_presence_of :caption, :location
  has_and_belongs_to_many :accounts
end
