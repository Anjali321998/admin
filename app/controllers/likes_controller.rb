class LikesController < ApplicationController
	
	def create
		@likeable = find_likeable
		@like = @likeable.likes.new
		@like.user_id = params[:format]
		@like.likeable_id = @likeable.id
		@like.likeable_type = @likeable.class
		@like.save!
		#@like = @likeable.likes.create(like_params)
		# redirect_to @	likeable
	end 
	def destroy
		@like = Like.find(params[:id])
		@like.destroy
	end                    

	private

	def find_likeable
		params.each { |name,value| return $1.classify.constantize.find(value) if name =~ /(.+)_id$/}
	end

	def like_params
		params.permit(:user_id,:likeable_id,:likeable_type)
	end
end
