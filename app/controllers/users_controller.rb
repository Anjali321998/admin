class UsersController < ApplicationController
	before_action :authenticate_user!, except: [:index, :search]	
	def search
		@users = User.where("name like ?" ,"%#{params[:name]}%")
	end
	
	def show
		@user = User.find(params[:id])
	end		
end
