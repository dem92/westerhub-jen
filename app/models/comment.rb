class Comment < ApplicationRecord
  belongs_to :project
  belongs_to :user

  validates :name, :presence => true
  validates :body, length: {minimum: 1, maximum: 500, :message => "Body must be between 1 and 500 characters."}
  validates :user, :presence => true
  validates :project, :presence => true
end
