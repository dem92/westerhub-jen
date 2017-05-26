class Comment < ApplicationRecord
  belongs_to :project
  belongs_to :user

  # TODO: length validation needs to be compared to user table
  validates :name, length: {minimum: 3, maximum: 50}
  validates :body, length: {minimum: 10, maximum: 500}
  validates :user, :presence => true
  validates :project, :presence => true
end
