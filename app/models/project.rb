class Project < ApplicationRecord
  mount_uploader :cover, CoverUploader
  belongs_to :user

  validates :title, :description, :contact, presence: true
  validates :title, length: {minimum: 3, maximum: 50}
  validates :description, length: {minimum: 10}
  validates :contact, length: {minimum: 8}
end
