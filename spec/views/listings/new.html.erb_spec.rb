require 'rails_helper'

RSpec.describe "listings/new", type: :view do
  before(:each) do
    assign(:listing, Listing.new(
      :title => "MyString",
      :category => "MyString",
      :owner => "MyString",
      :images => "MyString",
      :tags => "MyString",
      :location => "MyString",
      :description => "MyText",
      :price => 1.5
    ))
  end

  it "renders new listing form" do
    render

    assert_select "form[action=?][method=?]", listings_path, "post" do

      assert_select "input#listing_title[name=?]", "listing[title]"

      assert_select "input#listing_category[name=?]", "listing[category]"

      assert_select "input#listing_owner[name=?]", "listing[owner]"

      assert_select "input#listing_images[name=?]", "listing[images]"

      assert_select "input#listing_tags[name=?]", "listing[tags]"

      assert_select "input#listing_location[name=?]", "listing[location]"

      assert_select "textarea#listing_description[name=?]", "listing[description]"

      assert_select "input#listing_price[name=?]", "listing[price]"
    end
  end
end
