class Post < ActiveRecord::Base

  mount_uploader :photo, PhotoUploader
  acts_as_taggable
  belongs_to :user

  VALID_URL_REGEX = /(^$)|(^(http:\/\/|https:\/\/|\/))/ix

  validates :url, presence: true, uniqueness: true, format: { with: VALID_URL_REGEX }
  validates :photo, :tag_list, presence: true

  def self.search(search)
    if (search.present?)
      where("lower(notes) like :search OR lower(url) like :search", search: "%#{search.downcase}%").all
    else
      all
    end
  end

end
