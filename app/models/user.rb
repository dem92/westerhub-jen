class User < ApplicationRecord
  mount_uploader :image, CoverUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true
  validates_format_of :username, with: /\A[a-z0-9_-]{3,15}\z/
  validates :username, uniqueness: true, if: -> { self.username.present? }

  validates_format_of :first_name, with: /\A[A-Z][-a-zA-Z]{1,29}\z/i
  validates_format_of :last_name, with: /\A[A-Z][-a-zA-Z]{1,29}\z/i
  validates_format_of :email, with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  has_many :projects, dependent: :destroy
end
