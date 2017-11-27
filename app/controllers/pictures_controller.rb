class PicturesController < ApplicationController
  skip_authorization_check
  respond_to :html, :json

  # GET /pictures/1
  # GET /pictures/1.json
  def show
    @picture = Picture.find(params[:id])
    respond_with(@picture)
  end

  # GET /pictures/new
  # GET /pictures/new.json
  def new
    @listing = Listing.find(params[:listing_id])
    @picture = @listing.pictures.build
    respond_with(@picture)
  end

  # POST /pictures
  # POST /pictures.json
  def create
    @picture = Picture.new(picture_params)
    respond_with(@picture)
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    # @listing = Listing.find(params[:listing_id])
    # @picture = @listing.pictures.find(params[:id])
    @picture = Picture.find(params[:id])
    redirect_back :fallback_location => listing_path if @picture.destroy
  end

  private

  def picture_params
    params.require(:picture).permit(:listing_id, :image)
  end
end

