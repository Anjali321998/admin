class PostsController < ApplicationController
	
	before_action :find_post, only: [:show,:edit,:update,:destroy]

	def new
		@post = Post.new
	end 

	def show 
		@like = @post.existing_user_like(current_user.id)
		@comments = @post.comments
	end

	def create
		@post = current_user.posts.build(post_params)
		if @post.save
			redirect_to posts_path
		else
			render 'new'
		end
	end

	def update
		if @post.update(post_params)
			redirect_to post_path(@post)
		else
			render 'edit'
		end
	end

	def index
		users = current_user.friendships.ids
		users<<current_user.id
		@posts = Post.includes(:user).where(user_id: users) 
	end

	def destroy
		@post.destroy
		redirect_to posts_path
	end
	
	private
	
	def post_params
		params.require(:post).permit(:title, :data, likes_attributes: [:likeable], comments_attributes:[:id, :comment_text])
	end

	def find_post
		@post = Post.find(params[:id])
	end		
end