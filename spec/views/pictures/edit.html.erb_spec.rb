require 'rails_helper'

RSpec.describe "pictures/edit", type: :view do
  before(:each) do
<<<<<<< HEAD
    @picture = assign(:picture, Picture.create!())
=======
    @picture = assign(:picture, Picture.create!)
>>>>>>> b5d562dc2ce4a0b6227d665236f86fb89afb508e
  end

  it "renders the edit picture form" do
    render

    assert_select "form[action=?][method=?]", picture_path(@picture), "post" do
    end
  end
end
