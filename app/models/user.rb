class User < ActiveRecord::Base
	Paperclip.options[:command_path] = 'C:/Program Files/ImageMagick-6.9.2-Q16'
	has_attached_file :avatar, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#" }
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :bookmarks,  dependent: :destroy
  has_many :remarks, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_and_belongs_to_many :followers 
end
