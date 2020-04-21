class UsersController < ApplicationController
   
  def new
    # Just shows the signup form
    @user = User.new
  end

  def create
    # creates and saves the user into the DB
    if @user.save
      @user.picture.attach(params[:picture])
      flash[:notice] = "Account created successfully."
      redirect_to(root_path)
    else
      flash.now[:error] = "Registration failed"
      render(:template => 'new')
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
        :password,
        :picture
      )
    end
end
