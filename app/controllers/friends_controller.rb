class FriendsController < ApplicationController
	before_action :find_friend, only: [:accept,:reject,:destroy]
	def new
		@receiver = User.find(params[:format])
		@friend = Friend.create(sender_id: current_user.id,receiver_id: @receiver.id, status: :new_request)
		if @friend.save
			redirect_to user_path(current_user)
		end
	end
	def index
		@friends = current_user.friendships
	end
	def frequest
		@requests = current_user.requests
	end
	def accept
		@f.status = 'added'
		@f.save!
		redirect_to frequest_friend_path(current_user.id)
	end
	def reject
		@f.status = 'rejected'
		@f.save!
		redirect_to frequest_friend_path(current_user.id)
	end
	def destroy
		@f.destroy
		redirect_to friends_path
	end
	private
	def find_friend
		@f = Friend.find_by("sender_id = ? AND receiver_id = ?",params[:id],current_user.id)
	end
end
