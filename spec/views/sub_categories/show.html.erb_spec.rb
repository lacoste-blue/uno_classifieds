require 'rails_helper'

RSpec.describe "sub_categories/show", type: :view do
  before(:each) do
    @sub_category = assign(:sub_category, SubCategory.create!(
      :name => "Name",
      :description => "Description",
      :category => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(//)
  end
end
