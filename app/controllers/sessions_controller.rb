class SessionsController < ApplicationController
  def login
  	#Login form
  end

  def attempt_login
    if params[:email].present? && params[:password].present?
      found_user = User.where(:email => params[:email]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end
    if authorized_user
      #mark user as logged in
      session[:user_id]= authorized_user.id
      session[:username]= authorized_user.username
      flash[:notice] = "You are now logged in."
      redirect_to(:controller => 'Main',:action => 'home')
    else
      flash[:notice] = "Invalid username/password combination."
      redirect_to(:action => 'login')
    end
  end

  def logout
    # mark user as logged out
    session[:user_id]= nil
    session[:username]= nil
    flash[:notice] = "Logged out"
    redirect_to(:controller => "Main",:action => 'home')
  end

  def home
  	#Home Page
  end
end


