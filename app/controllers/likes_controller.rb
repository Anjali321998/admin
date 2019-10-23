class LikesController < ApplicationController
	
	before_action :find_likeable

	def create
		@like = @likeable.likes.build(user: current_user)
		@like.save!
	end 

	def destroy
		@like = @likeable.likes.find(params[:id])
		@like.destroy
	end                    

	private

	def find_likeable
		params.each { |name,value| @likeable = $1.classify.constantize.find(value) if name =~ /(.+)_id$/}
	end
end
