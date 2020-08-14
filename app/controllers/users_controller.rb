class UsersController < ApplicationController
   
  before_action :confirm_logged_in, :except => [:new, :create]

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
      render('new')
    end
  end


  def edit
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:first_name, :last_name, :nickname, :email, :password))
      flash[:notice] = "Account updated successfully."
      redirect_to(:controller => 'login', :action => 'show', :id => params[:id])
    else
      respond_to do |format|
      format.js
    end 
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
    
    def confirm_logged_in
      unless session[:user_id]
        flash[:alert] = "Please, log in first to get access to this area."
        redirect_to(login_index_path)
      end
    end

end
