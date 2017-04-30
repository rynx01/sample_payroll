class User < ApplicationRecord
  validates :username, uniqueness: { case_sensitive: false }, 
  presence: true, length: { minimum: 5, maximum: 50 }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
