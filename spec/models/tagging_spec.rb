require 'rails_helper'

RSpec.describe Tagging, :type => :model do
  it 'makes a new one' do
    expect(Tagging.new).to be_valid
  end
end

