require 'rails_helper'

RSpec.describe Category, :type => :model do
  it 'is valid with valid attributes' do
    expect(Category.new(:name => 'bob')).to be_valid
  end

  it 'is not valid without a name' do
    expect(Category.new).to_not be_valid
  end
end

