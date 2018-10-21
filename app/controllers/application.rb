# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  before_filter :login_required, :only => [ :destroy, :delete, :restore, :edit, :new, :update ]

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '7a6aa049b4e14247413fd0aaf87838bb'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  filter_parameter_logging :password

  def login_required
    if session[:user]
      return true
    end
    flash[:warning]= 'Please login to continue'
    session[:return_to] = request.request_uri
    redirect_to :controller => "admin_user", :action => 'login'
    return false 
  end

  def redirect_to_stored
    if return_to = session[:return_to]
      session[:return_to]=nil
      redirect_to(return_to)
    else
      redirect_to :controller=>'admin_user', :action=> 'welcome'
    end
  end
end
