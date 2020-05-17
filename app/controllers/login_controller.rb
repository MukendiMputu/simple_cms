class LoginController < ApplicationController
  before_action :confirm_logged_in, :except => [:index, :create, :delete]
  def index
    # Just renders the signin form
  end

  def create
    # checks presence of email and password and..
    if !(params[:email].blank? && params[:password].blank?)
      found_user = User.find_by_email(params[:email])
      if found_user
        # verify password
        if found_user.authenticate(params[:password])
          session[:user_id] = found_user.id
          flash[:notice] = "Welcome, #{found_user.nickname}!"
          # ... redirect to show action
          redirect_to(login_path(found_user.id))
        else
          flash[:error] = "Wrong email/password combination"
          redirect_back fallback_location: root_path
        end
      else
        flash[:error] = "Wrong email/password combination"
        redirect_back fallback_location: root_path
      end 
    else
      flash[:error] = "Please, fill in the fields properly"
      redirect_back fallback_location: root_path
    end
  end
  
  def show
    @user = User.find(params[:id])
    
  end

  def delete
    session[:user_id] = nil
    flash[:notice] = "You've been logged out successfully!"
    redirect_to(login_index_path)
  end

  private
    def confirm_logged_in
      unless session[:user_id]
        flash[:alert] = "Please, log in first to get access to this area."
        redirect_to(login_index_path)
      end
    end
end
