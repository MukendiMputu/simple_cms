class UsersController < ApplicationController
  
  has_secure_password

  def signup
    # Just shows the signup form
  end
  
  def create
    # creates and saves the user into the DB
    if @user.new(user_params)
      flash[:notice] = "Account created successfully."
      redirect_to(signin_users_path)
    else
      render(:template => 'signup')
    end
    
  end

  def signin
    # checks presence of email and password and..
    if params.key?(:user)
      if @user = User.find_by_email(login_params)#
        # verify password
        if @user.authenticate
          # ... redirect to show action
          redirect_to(user_path(@user.id))
        else
          flash[:alert] = "Login failed."
          redirect_to(root_path)
        end
      else
        flash[:alert] = "Login failed."
        redirect_to(root_path)
      end 
    end
    flash[:alert] = "Please, fill in the fields properly."
    redirect_to(root_path)
  end
  
    def show
      @user = User.find(1)
      @user_bookings = @user.bookings
    end

  def signout
  end

  def edit
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:first_name, :last_name, :nickname, :email, :password))
      flash[:notice] = "Account updated successfully."
      redirect_to(:action => 'show', :id => params[:id])
    else
      render(:template => 'edit')
    end
  end

  def delete
    
  end

  def destroy
      flash[:notice] = "Account destroyed successfully."
  end 


  private 

    def user_params
      params.require(:user).permit(
        :first_name, 
        :last_name, 
        :nickname, 
        :email, 
        :password
      )
    end

    def login_params
      params.require(:user).permit(
        :email, 
        :password
      )
    end
end
