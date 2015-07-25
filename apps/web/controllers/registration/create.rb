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
        @messages = []
        sign_up.errors.each do |error|
          content = "#{error.attribute_name} is invalid. Validation: #{error.validation}"
          @messages << {content: content, type: :danger}
        end
      end
    end
  end
end
