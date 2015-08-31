class Notification < ActiveRecord::Base
	belongs_to :user
	has_many :followers
end
