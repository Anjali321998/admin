class Post < ApplicationRecord
	validates :title, presence: true, length: {minimum: 5, maximum: 50}
	validates :data, presence: :true,length: {minimum: 10}
	belongs_to :user,foreign_key: :user_id 
	has_many :likes,as: :likeable, dependent: :destroy
	has_many :comments, dependent: :destroy, inverse_of: :post
	accepts_nested_attributes_for :comments, reject_if: :all_blank, allow_destroy: true
	def is_post_owner? current_user_id
		user_id == current_user_id
	end

	def existing_user_like current_user_id
		likes.find_by(user_id: current_user_id)
	end
end