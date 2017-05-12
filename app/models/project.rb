class Project < ApplicationRecord
  mount_uploader :cover, CoverUploader
  validates :description, presence: true
  validates :description, length: {minimum: 5}
  belongs_to :user
end
