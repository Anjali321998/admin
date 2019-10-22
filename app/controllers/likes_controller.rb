class LikesController < ApplicationController
	
	def create
		@likeable = find_likeable
		@like = @likeable.likes.create(like_params)
		redirect_to @likeable
	end
	
	def update 
		
	end

	private

	def find_likeable
		params.each { |name,value| return $1.classify.constantize.find(value) if name =~ /(.+)_id$/}
	end

	def like_params
		params.permit(:like_status,:likeable_id,:likeable_type)
	end
end
