class UsersController < ApplicationController
   
  def new
    # Just shows the signup form
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # instantiate and saves the user into the DB
    if @user.save
      flash[:notice] = "Account created successfully."
      @user.picture.attach(params[:user][:picture])
      redirect_to(login_index_path)
    else
      logger.error(@user.errors.full_messages)
      flash.now[:error] = "Something went wrong!"
      render(:template => '/users/new')
    end
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
    # Synchronously destroy the avatar and actual resource files.
    # user.avatar.purge

    # Destroy the associated models and actual resource files async, via Active Job.
    # user.avatar.purge_later
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
        :picture,
        :password,
        :password_confirmation # respect rails naming convention!!
      )
    end

end
