class Post < ApplicationRecord
	validates :title, presence: true, length: {minimum: 5, maximum: 50}
	validates :data, presence: :true,length: {minimum: 10}
	belongs_to :user,foreign_key: :user_id 
	has_many :likes,as: :likeable, dependent: :destroy

	def is_post_owner? current_user_id
		user_id == current_user_id
	end

	def like_exist? current_user_id
		@like = likes.find_by(user: current_user_id)
		return @like
	end
end
