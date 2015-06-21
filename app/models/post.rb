class Post < ActiveRecord::Base

  mount_uploader :photo, PhotoUploader
  belongs_to :user

  VALID_URL_REGEX = /(^$)|(^(http:\/\/|https:\/\/|\/))/ix

  validates :url, presence: true, uniqueness: true, format: { with: VALID_URL_REGEX }
  validates :photo, presence: true

end
