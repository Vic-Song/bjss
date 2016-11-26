class Course < ActiveRecord::Base
	has_many :chapters , :dependent => :destroy
	has_many :videos, through: :chapters
	has_many :comments, through: :videos
	has_many :posts , :dependent => :destroy
	has_many :replies, through: :posts
	mount_uploader :thumbnail_url,ThumbnailUrlUploader
	mount_uploader :trailer_url,TrailerUrlUploader
	validates :title, :teacher, :teacher_intro, :description, :thumbnail_url, :trailer_url, presence: true

	def self.latest
		Course.order(:updated_at).last
	end

	def self.search(query)
		if query
			where('title LIKE ? ',"%#{query}%")
		else
			all
		end
	end
end

