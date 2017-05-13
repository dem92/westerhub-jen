class User < ApplicationRecord
  mount_uploader :image, CoverUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true
  validates :username, uniqueness: true, if: -> { self.username.present? }

  has_many :projects, dependent: :destroy
end
