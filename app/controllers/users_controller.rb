class UsersController < ApplicationController
	#before_filter :signed_in_user, only: [:create]
	#before_filter :admin_user, only: :destroy
	
  def index
  	@users = User.all
  end


  def new
  	@user = User.new  		
	end

	def show

	end


	def create
  	if params[:create]
  		@user = User.new(params[:user])
  		if @user.save
  			flash[:success] = "New User created."
  			redirect_to index_path  			
  		else  					
  			render 'new'  			
  		end
  	elsif params[:cancel]
  		redirect_to index_path
  	end
	end


	def edit
		@user = User.find(params[:id])
	end


	def update
		if params[:save]
  		@user = User.find(params[:id])
  		if @user.update_attributes(params[:user])
  			flash[:success] = "Profile updated."
  			redirect_to index_path  			
  		else
  			render 'edit'  			
  		end
  	elsif params[:cancel]
  		redirect_to index_path
  	end
  end


	def destroy
		if params[:user_ids].nil?
			flash[:error] = "No user/s selected."
			redirect_to index_path
		else
			@users = User.find(params[:user_ids])
			@users.each do |user|
				user.destroy
			end
			#User.find(params[:user_id]).destroy
			# @user.destroy
			flash[:notice] = "User(s) was/were successfully deleted."
			redirect_to index_path
		end
	end

	#def destroy_multiple
		#User.destroy(params[:user_ids])

		# @users = User.find(params[:user_ids])
		# @users.each do |user|
		#  	user.destroy!
		# end

		# flash[:notice] = "User was successfully deleted."


		# respond_to do |format|
		# 	format.html { redirect_to index_path }
		# 	format.json { head :no_content }
		# end
	#end

end
