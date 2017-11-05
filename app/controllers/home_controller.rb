class HomeController < ApplicationController
  skip_authorization_check
  
  def index
    @categories = Category.all
    @listings = Listing.all
  end
end
