module Authentication
  UnauthenticatedError = Class.new(StandardError)

  module WebStrategy
    def self.included(klass)
      klass.class_eval do
        handle_exception UnauthenticatedError => :redirect_to_login
        before :authenticate!
      end
    end

    def authenticate!
      has_user_session? or raise UnauthenticatedError.new
    end

    private

    def has_user_session?
      !!session[:user_id]
    end

    def redirect_to_login
      redirect_to '/'
    end
  end
end