class Project < ApplicationRecord
  mount_uploader :cover, CoverUploader
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :project_tags
  has_many :tags, :through => :project_tags

  validates :title, length: {minimum: 3, maximum: 50, :message => ": Length must be in range 3-50 characters"}
  validates :description, length: {minimum: 10, maximum: 30000, :message => ": Length must be in range 10-30000 characters"}
  validates :contact, length: {minimum: 8, maximum: 250, :message => ": Length must be in range 8-250 characters"}
  validates :user, :presence => true
end
