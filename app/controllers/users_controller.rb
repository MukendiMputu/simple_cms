class UsersController < ApplicationController

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to(new_user_path)
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
    @user = User.find(params[:id])
  end

  def update

    redirect_to(:action => 'show', :id => params[:id])
  end

  def delete
    
  end

  def destroy
  end 

end
