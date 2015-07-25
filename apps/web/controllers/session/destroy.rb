require_relative '../../../../lib/authentications/web_strategy'
module Web::Controllers::Session
  class Destroy
    include Web::Action
    include Authentication::WebStrategy

    def call(params)
      session.delete(:user_id)
      redirect_to '/'
    end
  end
end
