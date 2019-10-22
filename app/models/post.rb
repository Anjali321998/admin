class Post < ApplicationRecord
	validates :title, presence: true, length: {minimum: 5, maximum: 50}

	validates :data, presence: :true,length: {minimum: 10}
	belongs_to :user,foreign_key: :user_id 
	#has_many :likes, as: :likeable, dependent: :destroy
	has_many :likes,as: :likeable, dependent: :destroy
end
