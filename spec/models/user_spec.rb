require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should require a password' do
      @user = User.new(first_name: 'Garrick', last_name: 'Henne', email: 'garrickhenne@outlook.com')

      expect { @user.save! }.to raise_error(/Password can't be blank/)
    end

    it 'should require unique emails' do
      @user = User.create(first_name: 'Garrick', last_name: 'Henne', email: 'garrickhenne@outlook.com', password: 'password')
      @user2 = User.new(first_name: 'Garrick', last_name: 'Henne', email: 'garrickhenne@outlook.com', password: 'password')

      expect { @user2.save! }.to raise_error(/duplicate key value violates unique constraint "index_users_on_email"/)
    end

    it 'should require a email' do
      @user = User.create(first_name: 'Garrick', last_name: 'Henne', email: nil, password: 'password')

      expect { @user.save! }.to raise_error(/Email can't be blank/)
    end

    it 'should require a first-name' do
      @user = User.create(first_name: nil, last_name: 'Henne', email: 'garrickhenne@outlook.com', password: 'password')

      expect { @user.save! }.to raise_error(/First name can't be blank/)
    end

    it 'should require a last-name' do
      @user = User.create(first_name: 'garrick', last_name: nil, email: 'garrickhenne@outlook.com', password: 'password')

      expect { @user.save! }.to raise_error(/Last name can't be blank/)
    end

    it 'should require a minimum length password' do
      # Minimum length is 6.
      @user = User.create(first_name: 'garrick', last_name: 'Henne', email: 'garrickhenne@outlook.com', password: '12345')

      expect { @user.save! }.to raise_error(/Password is too short/)
    end

    it 'should create a user with valid attributes given' do
      @user = User.create(first_name: 'garrick', last_name: 'Henne', email: 'garrickhenne@outlook.com', password: 'password')
      @user.save!

      expect(@user.id).to be_present
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should return a created user with correct email and password' do
      email = 'garrickhenne@outlook.com'
      password = 'password'
      User.create(first_name: 'garrick', last_name: 'Henne', email: email, password: 'password')
      
      @user = User.authenticate_with_credentials(email, password)

      expect(@user).to be_present
    end

    it 'should return nil if user email is not found' do
      email = 'garrickhenne@outlook.com'
      password = 'password'
      User.create(first_name: 'garrick', last_name: 'Henne', email: email, password: password)
      
      @user = User.authenticate_with_credentials('not@not.com', password)

      expect(@user).to be_nil
    end

    it 'should return nil if user email is found but password is incorrect' do
      email = 'garrickhenne@outlook.com'
      password = 'password'
      User.create(first_name: 'garrick', last_name: 'Henne', email: email, password: password)
      
      @user = User.authenticate_with_credentials(email, 'wrong')

      expect(@user).to be_nil
    end

    it 'should return user if given email has empty whitespace' do
      email = 'garrickhenne@outlook.com'
      password = 'password'
      User.create(first_name: 'garrick', last_name: 'Henne', email: email, password: password)

      @user = User.authenticate_with_credentials('     garrickhenne@outlook.com   ', password)

      expect(@user).to be_present
    end

    it 'should return user if givem email is not matched by case' do
      email = 'garrickhenne@outlook.com'
      password = 'password'
      User.create(first_name: 'garrick', last_name: 'Henne', email: email, password: password)

      @user = User.authenticate_with_credentials('GarrickHenne@Outlook.Com', password)

      expect(@user).to be_present
    end
  end
end
