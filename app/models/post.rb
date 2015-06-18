class Post < ActiveRecord::Base

  mount_uploader :photo, PhotoUploader
  belongs_to :user

  validates_presence_of :photo

end
