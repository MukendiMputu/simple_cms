class LoginController < ApplicationController

  def index
    # Just renders the signin form
  end

  def create
    # checks presence of email and password and..
    if params.key?(:email) && params.key?(:password)
      found_user = User.find_by_email(params[:email])
      if found_user
        # verify password
        if found_user.authenticate(params[:password])
          session[:user_id] = found_user.id
          # ... redirect to show action
          redirect_to(user_path(found_user.id))
        else
          flash[:alert] = "Login failed: wrong email/password."
          redirect_to(root_path)
        end
      else
        flash[:alert] = "Login failed."
        redirect_to(root_path)
      end 
    else
      flash[:alert] = "Please, fill in the fields properly."
      redirect_to(root_path)
    end
  end
  
  def show
  end

  def delete
  end

  private

end
