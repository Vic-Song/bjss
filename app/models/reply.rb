class Reply < ActiveRecord::Base
  belongs_to :post

  validates :content, :post_id, presence: true
end
