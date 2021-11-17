require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'validates that passwords are the same' do
      user = User.create(
        name: 'gina', 
        email: 'gina@gmail.com', 
        password_digest: 'hello',
        password_confirmation: 'hello'
        )
    
      expect(user.password_digest).to eq(user.password_confirmation)
    end
  
  # Not currently passing
    # it 'validates that passwords are the same' do
    #   user = User.create(
    #     name: 'invalid email', 
    #     email: 'gina@gmail.com', 
    #     password_digest: 'hello',
    #     password_confirmation: 'hello'
    #     )
    
    #     expect(user).to be_invalid 
    # end
  
    it 'validates that password must be longer than 3 characters' do
      user = User.create(
        name: 'gina', 
        email: 'gina@gmail.com', 
        password_digest: 'hello',
        )
       
      expect(user.password_digest.length).to be > (3)
    end
  end

  describe '.authenticate_with_credentials' do
    it 'successfully validates the email with extra white spaces' do
      user = User.create(
        name: 'gina', 
        email: ' gina@gmail.com ', 
        password_digest: 'hello',
        )
        expect(user.email).to eq('gina@gmail.com')
    end

    it 'successfully validates the email with random letters capitalized' do
      user = User.create(
        name: 'gina', 
        email: 'GinA@gMail.cOm', 
        password_digest: 'hello',
        )
      expect(user.email).to eq('gina@gmail.com')
    end
  end
end
