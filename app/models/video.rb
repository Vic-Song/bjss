class Video < ActiveRecord::Base
  belongs_to :chapter
  has_many :comments , :dependent => :destroy
  mount_uploader :video_url,VideoUrlUploader
  validates :title, :description, :video_url, :duration, :author, :chapter_id, presence: true
end
