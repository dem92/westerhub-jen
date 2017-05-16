class Tag < ApplicationRecord
  has_many :project_tags
  has_many :projects, :through => :project_tags

  has_and_belongs_to_many :users
end
