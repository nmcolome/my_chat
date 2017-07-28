class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      cookies.signed[:user_id] = @user.id
      redirect_to :root
    else
      redirect_to login_path
    end
  end

  def destroy
    cookies.delete :user_id
    session.delete :user_id
    redirect_to login_path
  end
end