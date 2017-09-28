require 'rails_helper'

RSpec.describe "sub_categories/index", type: :view do
  before(:each) do
    assign(:sub_categories, [
      SubCategory.create!(
        :name => "Name",
        :description => "Description",
        :category => nil
      ),
      SubCategory.create!(
        :name => "Name",
        :description => "Description",
        :category => nil
      )
    ])
  end

  it "renders a list of sub_categories" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
