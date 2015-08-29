class Remark < ActiveRecord::Base

	validates :bookmark_id, :body, :user_id, presence: true

	belongs_to :user
	belongs_to :bookmark
end
