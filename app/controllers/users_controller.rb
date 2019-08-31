class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def newform
    @user = User.new
  end

  def show 
    @user = User.find(params[:id])
  end

  def create 
    @user = User.new(user_params)
    if @user.save
      # Switch to the list screen and display a message saying "You have created new blog!"
      redirect_to  new_session_path, notice:  "You have signed up successfully! Log in now."
    else
      # Redraw the input form.
      render :newform, notice: "Failed to sign up"
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name,:last_name, :email_or_phone, :password, :password_confirmation, :date, :gender)
  end
end
