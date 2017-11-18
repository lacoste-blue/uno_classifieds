class ListingsController < ApplicationController
  before_action :set_listing, :only => %i[show edit update destroy action_name]
  responders :flash
  respond_to :html, :json
  load_and_authorize_resource

  # GET /listings
  # GET /listings.json
  def index
    redirect_params(params).each do |key, value|
      {
        @listings = @listings.public_send(key, value) => value
      }
    end

    respond_with(@listings)
  end

  # GET /listings/1
  # GET /listings/1.json
  def show; end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit; end

  # POST /listings
  # POST /listings.json
  def create
    @listing = Listing.new(listing_params)
    if @listing.save
      create_images if params[:images]
      flash[:notice] = 'Listing was successfully created.'
    end
    respond_with(@listing)
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    if @listing.update(listing_params)
      if params[:images] && create_images
        flash[:notice] = 'Listing was successfully updated.'
      end
    end
    respond_with(@listing)
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    redirect_back :fallback_location => listing_path, :alert => 'Successfully deleted listing' if @listing.destroy
  end

  def grid
    current_user.set_to_grid_view
    switch_to('grid')
  end

  def list
    current_user.set_to_list_view
    switch_to('list')
  end

  def switch_to(type)
    redirect_to listings_url(redirect_params(params)), :notice => "View switched to #{type}."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_listing
    @listing = Listing.find(params[:id])
    @pictures = @listing.pictures
  end

  def create_images
    params[:images].each do |image|
      if @listing.pictures.where(:image_file_name => image.original_filename).exists?
        @listing.errors.add(:base, 'Existing picture')
      else
        @listing.pictures.create(:image => image)
      end
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def listing_params
    params.require(:listing).permit(:title, :tag, :category_id, :user_id,
                                    :pictures, :all_tags, :location, :description, :price)
  end

  def redirect_params(params)
    params.permit(:category_id, :user_id, :tag)
  end
end

