require 'rails_helper'

RSpec.describe Tag, :type => :model do
  it 'makes a new one' do
    expect(Tag.new).to be_valid
  end
end

