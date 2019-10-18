class FriendsController < ApplicationController

	def create
		@receiver = User.find(params[:format])
		@friend = Friend.create(sender_id: current_user.id,receiver_id: @receiver.id, status: :new_request)
		redirect_to user_path(current_user)
	end
	
	def index
		@friends = current_user.friendships
	end
	
	def frequest
		@requests = current_user.requests
	end

	def update
		@friend = Friend.find(params[:id])
		@friend.update(status: params[:status])
		redirect_to frequest_friend_path(current_user.id)	
	end
	
	def destroy
		@friend = Friend.find_by("sender_id = ? AND receiver_id = ?",params[:id],current_user.id)
		@friend.destroy
		redirect_to friends_path
	end
end
