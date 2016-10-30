class Video < ActiveRecord::Base
  belongs_to :chapter
  has_many :comments

  validates :title, :description, :video_url, :duration, :author, :chapter_id, presence: true
end
