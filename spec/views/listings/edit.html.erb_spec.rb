require 'rails_helper'

RSpec.describe 'listings/edit', :type => :view do
  before(:each) do
    allow(view).to receive(:current_user).and_return(FactoryBot.create(:admin))
    @listing = FactoryBot.create(:listing)
  end

  it 'renders the edit listing form' do
    render

    assert_select 'form[action=?][method=?]', listing_path(@listing), 'post' do
      assert_select 'input#listing_title[name=?]', 'listing[title]'

      assert_select 'input#listing_location[name=?]', 'listing[location]'

      assert_select 'textarea#listing_description[name=?]', 'listing[description]'

      assert_select 'input#listing_price[name=?]', 'listing[price]'
    end
  end
end

