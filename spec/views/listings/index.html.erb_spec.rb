require 'rails_helper'

RSpec.describe('listings/index', :type => :view) {
  before(:each) do
    assign(:listings, [
             Listing.create!(
               :title => 'Title',
               :category => 'Category',
               :owner => 'Owner',
               :images => 'Images',
               :tags => 'Tags',
               :location => 'Location',
               :description => 'MyText',
               :price => 2.5
             ),
             Listing.create!(
               :title => 'Title',
               :category => 'Category',
               :owner => 'Owner',
               :images => 'Images',
               :tags => 'Tags',
               :location => 'Location',
               :description => 'MyText',
               :price => 2.5
             )
           ])
  end

  it 'renders a list of listings' do
    render
    assert_select 'tr>td', :text => 'Title'.to_s, :count => 2
    assert_select 'tr>td', :text => 'Category'.to_s, :count => 2
    assert_select 'tr>td', :text => 'Owner'.to_s, :count => 2
    assert_select 'tr>td', :text => 'Images'.to_s, :count => 2
    assert_select 'tr>td', :text => 'Tags'.to_s, :count => 2
    assert_select 'tr>td', :text => 'Location'.to_s, :count => 2
    assert_select 'tr>td', :text => 'MyText'.to_s, :count => 2
    assert_select 'tr>td', :text => 2.5.to_s, :count => 2
  end
}

