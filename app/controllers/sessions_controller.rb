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

    if authorized_user && !authorized_user.email_checked
      session[:user_id]= authorized_user.id
      session[:username]= authorized_user.username

      redirect_to(:action => "validate_email")
    
   

    elsif authorized_user
      #mark user as logged in
      
      session[:user_id]= authorized_user.id
      session[:username]= authorized_user.username
      @username = authorized_user.username
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
    redirect_to(:controller => "Main", :action => "home")
  end

  #Prompt to ask to change password(user does not have to)
  def validate_email
    
    user = User.where(:id => session[:user_id]).first
    if params[:password].present? && params[:confirm_password].present?
      
      if params[:password] != params[:password_confirmation]
       flash[:notice] = "The passwords you entered don't seem to match."
      
      elsif result = change_password(user.id, params[:password], params[:confirm_password])
        user.email_checked = true
        user.save!

        redirect_to(:action => 'home')
      end
        #send email to let user know
       
      
    end
    

  end

  def forgot_password
   user = User.where(:email => params[:email]).first
   if params[:email].present? && user.present?
    VerifyEmail.send_password_forgot(user).deliver_now
    flash[:notice] = " Your password has been reset, just wait for the email and login with your randomly generated password!"
    redirect_to(:action => 'login')
   elsif !params[:email].blank?
     
    flash[:notice] = " Looks like that email isn't in our records, check your email or go ahead and signup!"
   end
  end



  private
  def change_password(id, password, confirm_password)
    user = User.where(:id => id).first
    if password == confirm_password
      user.password = password
      user.password_confirmation = confirm_password
      user.save!
      return true
    end
    return false
  end


  public
  def home
  	#Home Page
  end
end
