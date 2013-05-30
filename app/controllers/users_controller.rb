class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def new
	end

	def edit
	end

	def destroy
		#if checkbox(checkbox).checked?
		# @users = User.find(params[:user_ids])
		# @users.each do |user|
		# 	user.destroy
		# end


		User.find(params[:user_id]).destroy
		# @user.destroy
			
		flash[:notice] = "User was successfully deleted."
		redirect_to index_path
		#else
			#flash[:notice] = "User was successfully."
			#redirect_to index_path
		#end
	end

end
