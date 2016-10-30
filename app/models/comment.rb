class Comment < ActiveRecord::Base
  belongs_to :video

  validates :content, :video_id, presence: true
end
