class Course < ActiveRecord::Base
	has_many :chapters
	has_many :posts
	mount_uploader :thumbnail_url,ThumbnailUrlUploader
	validates :title, :teacher, :teacher_intro, :description, :thumbnail_url, :trailer_url, presence: true

	def self.search(query)
		if query
			where('title LIKE ? ',"%#{query}%")
		else
			all
		end
	end
end

