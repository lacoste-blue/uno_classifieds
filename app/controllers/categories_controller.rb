class CategoriesController < ApplicationController
  before_action :set_category, :only => %i[show edit update destroy]
  respond_to :html, :json
  load_and_authorize_resource

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all
    respond_with(@categories)
  end

  # GET /categories/1
  # GET /categories/1.json
  def show; end

  # GET /categories/new
  def new
    @category = Category.new
    respond_with(@category)
  end

  # GET /categories/1/edit
  def edit; end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)
    flash[:notice] = 'Category was successfully created.' if @category.save
    respond_with(@category)
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    flash[:notice] = 'Category was successfully updated.' if @category.update(category_params)
    respond_with(@category)
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    redirect_back :fallback_location => categories_path, :alert => 'Category was successfully destroyed.' if @category.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def category_params
    params.require(:category).permit(:name, :description)
  end
end

