class SessionsController < ApplicationController
  def login
  	#Login form
  end

  def attempt_login
    if params[:email].present? && params[:password].present?
      found_user = User.where(:email => params[:email]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])



        if authorized_user.email_validation.present?
          session[:user_id]= authorized_user.id
          session[:username]= authorized_user.username

          redirect_to(:action => "validate_email")
        end

      end


   

    elsif authorized_user
      #mark user as logged in
      
      session[:user_id]= authorized_user.id
      session[:username]= authorized_user.username
      flash[:notice] = "You are now logged in."
      redirect_to(:action => 'home')
    
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
    redirect_to(:controller => "Users", :action => "home")
  end

  def validate_email
    user = User.where(:id => session[:user_id]).first
    email_code = user.email_validation
    #flash[:notice] = params[:code]
    #redirect_to(:controller => "Users", :action => "home")
    if params[:code].present?
      
      if params[:code] == email_code

        user.update(:email_validation => nil, :email_checked => true)


        flash[:notice] = session[:user_id]
        redirect_to(:controller => "Users", :action => "home")
      end
      #should redirect to main page after login and set the email validation to Nil 
    end
  end

  def home
  	#Home Page
  end
end
