class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id
  has_secure_password
  has_many :user_permissions
  has_many :permissions, through: :user_permissions

  validates :username, :email, presence: true, uniqueness: true
end
