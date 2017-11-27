require 'rails_helper'

RSpec.describe User, :type => :model do
  describe 'with valid attributes' do
    it 'requires email/password' do
      expect(User.new(:email => 's@uno.edu', :password => '123456')).to be_valid
    end
  end

  describe 'with invalid attributes' do
    it 'requires email/password' do
      expect(User.new).to_not be_valid
    end

    it 'requires uno email' do
      expect(User.new(:email => 's@gmail.com', :password => '123456')).to_not be_valid
    end

    it 'requires 6+ digit pw' do
      expect(User.new(:email => 's@uno.edu', :password => '123')).to_not be_valid
    end
  end
end

