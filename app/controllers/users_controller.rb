class UsersController < ApplicationController
	before_action :authenticate_user!, except: [:index, :search]
	def show
		@user = User.find(params[:id])
	end
	def search
		@users = User.where(":name = ?",params[:name])
	end
	def friends
		@user = User.find(params[:id])		
	end
end
