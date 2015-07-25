class UserRepository
  include Lotus::Repository

  def self.check_login(email, password)
    query.where(email: email, password: password).first
  end
end
