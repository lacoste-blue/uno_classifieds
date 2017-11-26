require 'rails_helper'

RSpec.describe 'listings/show', :type => :view do
  before(:each) do
    allow(view).to receive(:can?).and_return(true)
    @listing = FactoryBot.create(:listing)
  end

  it 'renders attributes in <p>' do
    FactoryBot.create(:user)
    render
    expect(rendered).to match(/title/)
  end
end

