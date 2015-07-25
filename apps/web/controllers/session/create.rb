module Web::Controllers::Session
  class Create
    include Web::Action

    params do
      param :sign_in do
        param :email
        param :password
      end
    end

    def call(params)
      user = UserRepository.check_login(params[:sign_in][:email], params[:sign_in][:password])
      if user
        session[:user_id] = user.id
      else
        @messages = ["Invalid email or password"]
      end

      redirect_to '/'
    end
  end
end
