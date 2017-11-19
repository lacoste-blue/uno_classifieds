require 'rails_helper'

RSpec.describe 'listings/edit', type: :view do
  before(:each) do
    view.stub(:current_user) { FactoryBot.create(:admin) }
    cat = FactoryBot.create(:category)
    @listing = assign(:listing, Listing.create!(
      :title => 'MyString',
      :category => cat,
      :user_id => 1,
      :location => 'MyString',
      :description => 'MyText',
      :price => 1.5
    ))
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
