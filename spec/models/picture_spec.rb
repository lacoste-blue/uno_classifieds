require 'rails_helper'

RSpec.describe Picture, :type => :model do
  it 'should create with valid attributes' do
    expect(Picture.new).to be_valid
  end
end

