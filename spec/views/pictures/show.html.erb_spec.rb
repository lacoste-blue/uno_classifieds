require 'rails_helper'

RSpec.describe "pictures/show", type: :view do
  before(:each) do
<<<<<<< HEAD
    @picture = assign(:picture, Picture.create!())
=======
    @picture = assign(:picture, Picture.create!)
>>>>>>> b5d562dc2ce4a0b6227d665236f86fb89afb508e
  end

  it "renders attributes in <p>" do
    render
  end
end
