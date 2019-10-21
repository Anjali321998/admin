class PostsController < ApplicationController
	
	def new
		@post = Post.new
	end

	def create
		@post = current_user.posts.new(post_params)
		if @post.save
			redirect_to users_path
		else
			render 'new'
		end
	end

	def index
		users = current_user.friendships.ids
		users<<current_user.id
		@posts = Post.includes(:user).where(user_id: users) 
	end

	def show
		@post = Post.find(params[:id])
	end
	
	private
	
	def post_params
		params.require(:post).permit(:title, :data,:user_id, likes_attributes: [:likeable])
	end
end
