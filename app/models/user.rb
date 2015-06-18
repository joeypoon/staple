class User < ActiveRecord::Base

  has_secure_password
  has_many :posts

  validates :username, :email, presence: true
  #TODO validate email format

end
