module SessionsHelper

  def log_in user
    session[:user_id] = user.id
  end

  def current_user
    # DBへの問い合わせの数を可能な限り小さくしたい。
    # if @current_user.nil?
    #   @current_user = User.find_by(id: session[:user_id])
    #   return @current_user
    # else
    #   return @current_user
    # end

    # a += 1
    # a = a + 1
    # @user ||= => @user || User.find

    @current_user ||= User.find_by(id: session[:user_id])

  end

  def logged_in?
    !current_user.nil?
  end

  # 現在のユーザをログアウトする
  def log_out
    session.destroy
    @current_user = nil

  end

end
