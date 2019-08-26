class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email_or_phone: params[:session][:email_or_phone].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to '/posts'
    else
      flash[:danger] = 'Failed to login'
      render 'new'
    end
  end
  def destroy
    session.delete(:user_id)
    flash[:notice] = 'You logged out'
    redirect_to new_session_path
  end
end
