class Post < ActiveRecord::Base

  mount_uploader :photo, PhotoUploader
  belongs_to :user

  validates :photo, presence: true
  validates :url, presence: true
  validates :notes, presence: true

end
