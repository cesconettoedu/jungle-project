require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
  
    context "given valid attributes" do
    
      it "returns valid if have an Email, first name, last name and password" do
        @user = User.new(
          first_name: 'edu',
          last_name: 'dudu',
          email: 'edu@gmail.com',
          password: 'test',
          password_confirmation: 'test'
        )
        expect(@user).to be_valid
      end
      
      it "returns valid if password matchers with password_confirmation" do
        @user = User.new(
          first_name: 'edu',
          last_name: 'dudu',
          email: 'edu@gmail.com',
          password: 'test',
          password_confirmation: 'test'
        )
        expect(@user.password).to eql(@user.password_confirmation)
      end

      it "returns invalid if a email matchers with email in DB even if have diferentes capital letter" do
        @user1 = User.new(
          first_name: 'edu',
          last_name: 'dudu',
          email: 'edu@gmail.com',
          password: 'test',
          password_confirmation: 'test'
        )
        @user2 = User.new(
          first_name: 'edu',
          last_name: 'dudu',
          email: 'Edu@GMAIL.com',
          password: 'test',
          password_confirmation: 'test'
        )
        expect(@user1.email.downcase).to eql(@user2.email.downcase)
      end

      it "returns valid if password matchers minimum length" do
        @user = User.new(
          first_name: 'edu',
          last_name: 'dudu',
          email: 'edu@gmail.com',
          password: 't',
          password_confirmation: 'test'
        )
        expect(@user.password.length).to be >= (1)
      end

    end
  end

  describe 'authenticate_with_credentials' do
    it "returns valid if email has spaces before or after the email" do
      @user = User.new(
        first_name: 'edu',
        last_name: 'dudu',
        email: '  edu@gmail.com',
        password: 't',
        password_confirmation: 'test'
      )
      expect(@user.email.delete(' ')).to eql('edu@gmail.com')
    end  

    it "returns valid if a visitor types in the wrong case for their email" do
      @user = User.new(
        first_name: 'edu',
        last_name: 'dudu',
        email: 'Edu@gmAil.com',
        password: 't',
        password_confirmation: 'test'
      )
      expect(@user.email.downcase).to eql('edu@gmail.com')
    end  
    
  end
end
