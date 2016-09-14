class Post < ApplicationRecord
  validates_presence_of :caption, :location, :image
  has_and_belongs_to_many :accounts
  has_attached_file :image, styles: { :medium => "640>", :thumb => "200#" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
