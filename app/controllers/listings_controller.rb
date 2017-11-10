class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy, :action_name]
  load_and_authorize_resource


  # GET /listings
  # GET /listings.json
  def index

    if params[:category_id]
      @listings = Listing.by_category(params[:category_id])
    elsif params[:tag]
      @listings = Listing.tagged_with(params[:tag])
    elsif params[:user_id]
      @listings = Listing.by_user(params[:user_id])
    else
      @listings = Listing.all
    end

  end

  # GET /listings/1
  # GET /listings/1.json
  def show

  end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = Listing.new(listing_params)

    respond_to do |format|
      if @listing.save

        if params[:images]
          create_images
        end
        format.html {redirect_to @listing, notice: 'Listing was successfully created.'}
        format.json {render :show, status: :created, location: @listing}
      else
        format.html {render :new}
        format.json {render json: @listing.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        if params[:images] && create_images
          format.html {redirect_to @listing, notice: 'Listing was successfully updated.'}
          format.json {render :show, status: :ok, location: @listing}
        else
        format.html {render :edit}
        format.json {render json: @listing.errors, status: :unprocessable_entity}
        end
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html {redirect_to listings_url, notice: 'Listing was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  def grid
    respond_to do |format|
      current_user.set_to_grid_view
      format.html {redirect_to listings_url(redirect_params(params)), notice: 'View switched to grid.'}
      format.json {head :no_content}
    end
  end

  def list
    respond_to do |format|
      current_user.set_to_list_view
      puts '_________________________________________________'
      puts params
      format.html {redirect_to listings_url(redirect_params(params)), notice: 'View switched to list.'}
      format.json {head :no_content}
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_listing
    @listing = Listing.find(params[:id])
    @pictures = @listing.pictures
  end

  def create_images
    params[:images].each {|image|
      if @listing.pictures.where(image_file_name: image.original_filename).exists?
        @listing.errors.add(:base, "Existing picture")
      else
        @listing.pictures.create(image: image)
      end
    }
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def listing_params
    params.require(:listing).permit(:title, :tag, :category_id, :user_id, :pictures, :all_tags, :location, :description, :price)
  end

  def redirect_params(params)
    params.permit(:category_id, :user_id, :tag)
  end
end
