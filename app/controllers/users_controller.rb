class UsersController < ApplicationController
   
  def new
    # Just shows the signup form
  end

  def create
    # creates and saves the user into the DB
    @user.new(user_params)
    if @user.save
      flash[:notice] = "Account created successfully."
      redirect_to(login_index_path)
    else
      render(:template => 'signup')
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
        :password
      )
    end
end
