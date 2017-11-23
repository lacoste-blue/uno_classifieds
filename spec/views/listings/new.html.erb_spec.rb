require 'rails_helper'

RSpec.describe 'listings/new', :type => :view do
  before(:each) do
    allow(view).to receive(:current_user).and_return(FactoryBot.create(:admin))
    cat = FactoryBot.create(:category)
    assign(:listing, Listing.new(
                       :title => 'MyString',
                       :category => cat,
                       :user_id => 1,
                       :location => 'MyString',
                       :description => 'MyText',
                       :price => 1.5
    ))
  end

  it 'renders new listing form' do
    render

    assert_select 'form[action=?][method=?]', listings_path, 'post' do
      assert_select 'input#listing_title[name=?]', 'listing[title]'

      assert_select 'input#listing_location[name=?]', 'listing[location]'

      assert_select 'textarea#listing_description[name=?]', 'listing[description]'

      assert_select 'input#listing_price[name=?]', 'listing[price]'
    end
  end
end

