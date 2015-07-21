require 'byebug'
require_relative '../../../../lib/form-objects/sign_up'

module Web::Controllers::Registration
  class Create
    include Web::Action

    expose :error

    def call(params)
      sign_up = ::FormObject::SignUp.new(params[:sign_up])
      if sign_up.valid?
        user = User.new(sign_up.to_h)
        UserRepository.create(user)
        redirect_to '/'
      else
        @error = 'Invalid'
      end
    end
  end
end
