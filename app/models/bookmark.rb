class Bookmark < ActiveRecord::Base
	Paperclip.options[:command_path] = 'C:/Program Files/ImageMagick-6.9.2-Q16'
	has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
	validates :category_id, :subcategory_id, :title, :url, :description, presence: true
	#validates :url, :with => /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix

	acts_as_votable
	belongs_to :user
	belongs_to :subcategory
	has_many :remarks, dependent: :destroy
end
