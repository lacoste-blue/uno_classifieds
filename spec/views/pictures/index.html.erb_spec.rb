require 'rails_helper'

RSpec.describe "pictures/index", type: :view do
  before(:each) do
    assign(:pictures, [
<<<<<<< HEAD
      Picture.create!(),
      Picture.create!()
=======
        Picture.create!,
        Picture.create!
>>>>>>> b5d562dc2ce4a0b6227d665236f86fb89afb508e
    ])
  end

  it "renders a list of pictures" do
    render
  end
end
