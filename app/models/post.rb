class Post < ActiveRecord::Base

  mount_uploader :photo, PhotoUploader
  belongs_to :user

  validates :photo, :url, presence: true
  #TODO validate url is link

end
