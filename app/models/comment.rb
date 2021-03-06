class Comment < ApplicationRecord
	belongs_to :post, foreign_key: :post_id
	belongs_to :user, foreign_key: :user_id
	has_many :likes, as: :likeable, dependent: :destroy

	def is_comment_owner? current_user_id
		user_id == current_user_id
	end
end
