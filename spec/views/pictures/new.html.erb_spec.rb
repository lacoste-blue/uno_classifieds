require 'rails_helper'

RSpec.describe "pictures/new", type: :view do
  before(:each) do
<<<<<<< HEAD
    assign(:picture, Picture.new())
=======
    assign(:picture, Picture.new)
>>>>>>> b5d562dc2ce4a0b6227d665236f86fb89afb508e
  end

  it "renders new picture form" do
    render

    assert_select "form[action=?][method=?]", pictures_path, "post" do
    end
  end
end
