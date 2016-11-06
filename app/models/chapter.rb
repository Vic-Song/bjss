class Chapter < ActiveRecord::Base
  belongs_to :course
  has_many :videos , :dependent => :destroy

  validates :title, :description, :course_id, presence: true
end
