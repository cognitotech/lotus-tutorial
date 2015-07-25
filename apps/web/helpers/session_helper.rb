module SessionHelper
  def self.included(base)
    base.class_eval do
      expose :current_user
    end
  end
  def current_user
    return @current_user if @current_user
    if session[:user_id]
      @current_user = UserRepository.find(session[:user_id])
    end
  end
end