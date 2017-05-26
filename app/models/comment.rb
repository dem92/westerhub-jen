class Comment < ApplicationRecord
  belongs_to :project
  belongs_to :user

  validates :name, length: {minimum: 2, maximum: 30}
  validates :body, length: {minimum: 10, maximum: 500}
  validates :user, :presence => true
  validates :project, :presence => true
end
