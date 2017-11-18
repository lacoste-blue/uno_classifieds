require 'rails_helper'

RSpec.describe 'listings/show', type: :view do
  before(:each) do
    @listing = assign(:listing, Listing.create!(
      :title => 'Title',
      :category => 'Category',
      :owner => 'Owner',
      :images => 'Images',
      :tags => 'Tags',
      :location => 'Location',
      :description => 'MyText',
      :price => 2.5
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Category/)
    expect(rendered).to match(/Owner/)
    expect(rendered).to match(/Images/)
    expect(rendered).to match(/Tags/)
    expect(rendered).to match(/Location/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2.5/)
  end
end
