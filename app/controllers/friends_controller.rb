class FriendsController < ApplicationController
	before_action :find_friend, only: [:accept,:reject]

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
		@friend.status = "added"
		if @friend.save
			redirect_to frequest_friend_path(current_user.id)
		end
	end
	
	def reject
		@friend.status = "rejected"
		if @friend.save
			redirect_to frequest_friend_path(current_user.id)
		end
	end
	
	def destroy
		@friend = Friend.find_by("sender_id = ? AND receiver_id = ?",params[:id],current_user.id)
		@friend.destroy
		redirect_to friends_path
	end
	
	private
	
		def find_friend
		@friend = Friend.find(params[:id])
		end
end
