class Chapter < ActiveRecord::Base
  belongs_to :course
  has_many :videos

  validates :title, :description, :course_id, presence: true
end
