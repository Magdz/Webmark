class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :bookmarks,  dependent: :destroy
  has_many :remarks, dependent: :destroy
  has_many :users
  belongs_to :user
end
