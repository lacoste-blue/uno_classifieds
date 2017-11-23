require 'rails_helper'

RSpec.describe 'listings/index', :type => :view do
  before(:each) do
    allow(view).to receive(:current_user).and_return(FactoryBot.create(:admin))
    FactoryBot.create(:category)
    @listings = build_list(:listing, 2)
  end

  module StubControllerMethod
    def redirect_params(params)
      {}
    end
  end


  it 'renders a list of listings' do
    controller.extend(StubControllerMethod)
    render
    expect(rendered).to match(/title/)
    # assert_select 'tr>td', :text => 'Title'.to_s, :count => 2
    # assert_select 'tr>td', :text => 'Location'.to_s, :count => 2
    # assert_select 'tr>td', :text => 'MyText'.to_s, :count => 2
    # assert_select 'tr>td', :text => 2.5.to_s, :count => 2
  end
end

