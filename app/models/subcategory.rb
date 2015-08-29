class Subcategory < ActiveRecord::Base

	validates :title, :category_id, presence: true

	belongs_to :category
	has_many :bookmarks
end
