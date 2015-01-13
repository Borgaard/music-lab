class SessionsController < ApplicationController

	def new
		@user = User.new
	end

	def create #creates new session, not new user
	  @user = User.find_by_username(params[:username])

	  if @user.authenticate(params[:password])
	    session[:user_id] = @user.id
	    redirect_to root_path
	  else
	    flash[:error] = "Invalid username & password combination"
	    render :new
	  end
	end

	def destroy #logout user
		session[:user_id] = nil 
  	redirect_to root_path
	end

end