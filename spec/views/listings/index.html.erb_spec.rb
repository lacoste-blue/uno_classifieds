require 'rails_helper'

RSpec.describe 'listings/index', :type => :view do
  before(:each) do
    allow(view).to receive(:current_user).and_return(FactoryBot.create(:admin))
    allow(view).to receive(:can?).and_return(true)
    FactoryBot.create(:category)
    FactoryBot.create(:listing)
    FactoryBot.create(:listing)
  end

  module StubControllerMethod
    def redirect_params(_params)
      {}
    end
  end

  it 'renders a list of listings' do
    @listings = Listing.all
    controller.extend(StubControllerMethod)
    render
    expect(rendered).to match(/title/)
    # assert_select 'tr>td', :text => 'Title'.to_s, :count => 2
    # assert_select 'tr>td', :text => 'Location'.to_s, :count => 2
    # assert_select 'tr>td', :text => 'MyText'.to_s, :count => 2
    # assert_select 'tr>td', :text => 2.5.to_s, :count => 2
  end
end

