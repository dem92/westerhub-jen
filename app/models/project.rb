class Project < ApplicationRecord
  mount_uploader :cover, CoverUploader
  belongs_to :user
  has_many :project_tags
  has_many :tags, :through => :project_tags

  validates :title, length: {minimum: 3, maximum: 50}
  validates :description, length: {minimum: 10, maximum: 30000}
  validates :contact, length: {minimum: 8, maximum: 250}
end
