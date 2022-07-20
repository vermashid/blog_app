class SessionsController < ApplicationController
	def create
		@user = User.authenticate(params[:email], params[:password])
		if @user
			flash[:notice] = "You've signed in."
			session[:user_id] = @user.id
			session[:email] = @user.email
			redirect_to "/"
		else
			flash[:alert] = "There was a problem signing in. Please try again."
			redirect_to signin_path
		end
	end
	def destroy
		@session.destroy
		flash[:notice] = "You've signed out."
		redirect_to "/"
	end
end
