class CommentsController < ApplicationController

	before_action :find_post

	def create
		@comment = @post.comments.build(comment_params)
		@comment.user_id = current_user.id
		if @comment.save
			redirect_to post_path(@post)
		else
			render 'new'
		end
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post)
	end 

	private

	def comment_params
		params.permit(:comment_text)
	end

	def find_post
		@post = Post.find(params[:post_id])
	end
end
