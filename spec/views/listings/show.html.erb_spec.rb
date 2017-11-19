require 'rails_helper'

RSpec.describe 'listings/show', type: :view do
  before(:each) do
    FactoryBot.create(:category)
    @listing = assign(:listing, Listing.create!(
      :title => 'Title Woah!',
      :category_id => 1,
      :user_id => 1,
      :location => 'Location',
      :description => 'MyText',
      :price => 2.5
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title Woah!/)
  end
end
