class User < ActiveRecord::Base
  has_secure_password

  validates_uniqueness_of :email
  # validate format of password
end
