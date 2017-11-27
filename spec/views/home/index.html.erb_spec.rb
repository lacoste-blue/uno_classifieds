require 'rails_helper'

RSpec.describe 'home/index.html.erb', :type => :view do
  it 'makes a page' do
    FactoryBot.create(:category)
    FactoryBot.create(:listing)
    @categories = Category.all
    @listings = Listing.all
    render
    expect(rendered).to include('No pictures')
  end
end

