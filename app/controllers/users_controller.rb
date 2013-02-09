class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => 'Signed Up!'
    else
      render "new"
    end
  end
  def change_password
    @user =current_user
    if request.post? 
      if @user.authenticate( params[:password][:old_password]) == @user 
        @user.password = params[:password][:new_password] 
        @user.password_confirmation = params[:password][:new_password_confirmation] 
        if @user.save 
          flash[:notice] = 'Your password has been changed' 
          redirect_to '/change_password' 
        else 
          flash[:error] = 'Unable to change your password' 
        end 
      else 
        flash[:error] = 'Invalid password' 
      end 
    end  
  end
end
