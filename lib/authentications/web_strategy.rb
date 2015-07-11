module Authentication
  UnauthenticatedError = Class.new(StandardError)

  module WebStrategy
    def authenticate!
      has_user_session? or raise UnauthenticatedError.new
    end

    private

    def has_user_session?
      !!session[:user_id]
    end
  end
end