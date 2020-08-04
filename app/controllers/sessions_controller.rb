class SessionsController < ApplicationController
  def new

  end

  def create

    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      redirect_to "/users/#{@user.id}"
    else
      flash[:danger] = 'Invalid email/password combination' # 本当は正しくない
      render "new"
    end
  end
end
