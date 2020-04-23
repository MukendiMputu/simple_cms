class UsersController < ApplicationController
   
  def new
    # Just shows the signup form
    @user = User.new
  end

  def create
    console
    @user = User.new(user_params)
    # creates and saves the user into the DB
    if @user.save!
      flash[:notice] = "Account created successfully."
      @user.picture.attach(params[:user][:picture])
      redirect_to(login_index_path)
    else
      #   render('new')
      @user.errors.full_messages.each do |msg|
        puts "Create raised this: #{msg}"
        flash.now[:error] = "Create raised this: #{msg}"
      end
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
