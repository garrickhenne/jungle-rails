class User < ApplicationRecord
  has_secure_password

  validates :first_name, :last_name, :email, presence: true
  validates :password, length: { minimum: 6 }

  def self.authenticate_with_credentials(email, password)
    @foundUser = User.find_by_email(email.strip.downcase)

    @foundUser && @foundUser.authenticate(password) ? @foundUser : nil
  end
end
