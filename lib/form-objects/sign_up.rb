module FormObject
  class SignUp
    include Lotus::Validations

    attribute :email, type: String, presence: true, format: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    attribute :name, type: String, presence: true
    attribute :password, confirmation: true
  end
end