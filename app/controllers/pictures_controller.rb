class PicturesController < ApplicationController
  
  

  # GET /pictures/1
  # GET /pictures/1.json
  def show
    @picture = Picture.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @picture }
    end
  end

  # GET /pictures/new
  # GET /pictures/new.json
  def new
    @listing = Listing.find(params[:listing_id])
    @picture = @listing.pictures.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @picture }
    end
  end

  # GET /pictures/1/edit
  def edit
    #@listing = Listing.find(params[:listing_id])

    @picture = Picture.find(params[:id])
    # @picture = Picture.find(params[:id])
  end

  # POST /pictures
  # POST /pictures.json
  def create
    @picture = Picture.new(params[:picture])
  end

  # PUT /pictures/1
  # PUT /pictures/1.json
  def update

    # @listing = Listing.find(params[:listing_id])

    @picture = Picture.find(params[:id])

    respond_to do |format|
      if @picture.update_attributes(picture_params)
        format.html { redirect_to :back, notice: 'Picture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    #@listing = Listing.find(params[:listing_id])
    #@picture = @listing.pictures.find(params[:id])
    @picture = Picture.find(params[:id])
    @picture.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end


  private

  def picture_params
    params.require(:picture).permit(:listing_id, :image)
  end
end