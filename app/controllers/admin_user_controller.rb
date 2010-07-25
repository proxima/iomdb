class AdminUserController < ApplicationController

  before_filter :login_required, :only=>['welcome', 'change_password', 'hidden']

  def signup
    @user = AdminUser.new(params[:user])
    if request.post?
      if @user.save
        session[:user] = AdminUser.authenticate(@user.login, @user.password)
        flash[:notice] = "Signup successful"
        redirect_to :action => "welcome"          
      else
        flash[:notice] = "Signup unsuccessful"
      end
    end
  end

  def login
    if request.post?
      if session[:user] = AdminUser.authenticate(params[:user][:login], params[:user][:password])
        flash[:notice]  = "Login successful"
        redirect_to_stored
      else
        flash[:notice] = "Login unsuccessful"
      end
    end
  end

  def logout
    session[:user] = nil
    flash[:notice] = 'Logged out'
    redirect_to :action => 'login'
  end


  def delete
  end

  def edit
  end

  def forgot_password
    if request.post?
      u = AdminUser.find_by_email(params[:user][:email])
      if u and u.send_new_password
        flash[:notice]  = "A new password has been sent by email."
        redirect_to :action=>'login'
      else
        flash[:notice]  = "Couldn't send password"
      end
    end
  end

  def change_password
    @user=session[:user]
    if request.post?
      @user.update_attributes(:password=>params[:user][:password], :password_confirmation => params[:user][:password_confirmation])
      if @user.save
        flash[:notice]="Password Changed"
      end
    end
  end

  def welcome
    redirect_to :controller => 'pages', :action => 'index'
  end

  def hidden
  end
end
