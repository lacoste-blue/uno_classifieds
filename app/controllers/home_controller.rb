class HomeController < ApplicationController
  skip_authorization_check

  def index
    @categories = Category.all

    ###
    if params[:search]
      redirect_to listings_url(redirect_params(params))
    else
      @listings = Listing.all
    end
    ###
  end

  ###

  private

  def redirect_params(params)
    # params.permit(:category_id, :user_id, :tag, :search)
    params.permit(:search)
  end
  ###
end

