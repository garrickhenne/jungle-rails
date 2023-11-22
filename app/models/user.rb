class User < ApplicationRecord
  has_secure_password

  validates :first_name, :last_name, :email, presence: true
  validates :password, length: { minimum: 6 }

  def self.authenticate_with_credentials(email, password)
    @found_user = User.find_by_email(email.strip.downcase)

    @found_user&.authenticate(password) ? @found_user : nil
  end
end
