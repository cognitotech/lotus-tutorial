module Web::Views::Registration
  class Index
    include Web::View

    def sign_up_form
      # params = {}
      form_for :sign_up, '/registration/create' do
        email_field :email
        text_field :display_name
        password_field :password
        password_field :password_confirmation
      end
    end
  end
end
