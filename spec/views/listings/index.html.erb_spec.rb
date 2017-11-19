require 'rails_helper'

RSpec.describe 'listings/index', type: :view do
  before(:each) do
    view.stub(:current_user) { FactoryBot.create(:admin) }
    FactoryBot.create(:category)
    assign(:listings, [
      Listing.create!(
        :title => 'Title',
        :category_id => 1,
        :user_id => 1,
        :location => 'Location',
        :description => 'MyText',
        :price => 2.5
      ),
      Listing.create!(
        :title => 'Title',
        :category_id => 1,
        :user_id => 1,
        :location => 'Location',
        :description => 'MyText',
        :price => 2.5
      )
    ])
  end

  it 'renders a list of listings' do
    render
    expect(rendered).to match(/Title/)
    # assert_select 'tr>td', :text => 'Title'.to_s, :count => 2
    # assert_select 'tr>td', :text => 'Location'.to_s, :count => 2
    # assert_select 'tr>td', :text => 'MyText'.to_s, :count => 2
    # assert_select 'tr>td', :text => 2.5.to_s, :count => 2
  end
end
