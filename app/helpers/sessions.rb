helpers do
  
  def current_user
    @user ||= Lover.find(session[:user_id]) if session[:user_id]
  end

end
