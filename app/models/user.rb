class User < ApplicationRecord
  validates_confirmation_of :password
  validates :username, uniqueness: true, presence:true
  validates_presence_of :password_digest, require: true
  has_secure_password

end
