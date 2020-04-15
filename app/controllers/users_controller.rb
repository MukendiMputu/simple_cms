class UsersController < ApplicationController

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to(signin_users_path)
    else
      render(:template => 'signup')
    end
  end


  
  def signup
  end

  def signin
  end

  def signout
  end

  def show
    @user = User.find(params[:id])
    @user_bookings = @user.bookings

  end

  def edit
    @user = User.find(user_params)
  end

  def update
    if @user.save
      redirect_to(:action => 'show', :id => params[:id])
    else
      render(:template => 'edit')
    end
  end

  def delete
    
  end

  def destroy
  end 


  private 

  def user_params
    params.require(:user).permit(:first_name, :last_name, :nickname, :email, :password)
  end
end
