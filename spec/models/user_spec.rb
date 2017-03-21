require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) {
   User.new(
      first_name: "Johnny",
      last_name: "Bravo",
      email: "jb@hotmail.com",
      password: "hi1234",
      password_confirmation: "hi1234" )
  }

  describe 'Validations' do
    it 'matches the password does not match error message' do
      user.password_confirmation = "yoyoyo"
      user.save
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'matches email already exists error message' do
      user.save!
      new_user = User.create(
        first_name: "JB",
        last_name: "Smith",
        email: "JB@HOtmail.com",
        password: "123",
        password_confirmation: "123")
      expect(new_user.errors.full_messages).to include("Email has already been taken")
    end

    it 'matches the cannot be blank error message for empty first_name' do
      user.first_name = nil
      user.save
      expect(user.errors.full_messages).to include("First name can't be blank")
    end

    it 'matches the cannot be blank error message for empty first_name' do
      user.email = nil
      user.save
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it 'matches the cannot be blank error message for empty first_name' do
      user.last_name = nil
      user.save
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'matches the password must have minimum error message' do
      user.password = "2"
      user.save
      expect(user.errors.full_messages).to include(/Password is too short/)
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should not return nil when correct user email and password is passed' do
      user.save!
      user_return = User.authenticate_with_credentials(user.email, user.password)
      expect(user_return).to_not be_nil
    end

    it 'should not return nil if there are spaces before and/or after email' do
      user.save!
      email = user.email.prepend("     ").concat("     ")
      user_return = User.authenticate_with_credentials(email, user.password)
      expect(user_return).to_not be_nil
    end

    it 'should not return nil if email is in a different case' do
      user.save!
      email = user.email.swapcase
      user_return = User.authenticate_with_credentials(email, user.password)
      expect(user_return).to_not be_nil
    end
  end

end
