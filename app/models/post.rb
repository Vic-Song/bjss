class Post < ActiveRecord::Base
  belongs_to :course
  has_many :replies

  validates :title, :content, :course_id,presence: true
end
