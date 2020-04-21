class UsersController < ApplicationController
   
  def new
    # Just shows the signup form
  end

  def create
    console
    new_user = User.new(user_params)
    # creates and saves the user into the DB
    if new_user.save?
        redirect_to(login_index_path)
    #   @user.picture.attach(params[:user][:picture])
    #   flash[:notice] = "Account created successfully."
    #   redirect_to(login_index_path)
    else
    #   flash.now[:error] = "Registration failed"
    #   render('new')
        redirect_to(new_user_path)
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
