class ProductsController < ApplicationController
  before_action :set_product,         only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:edit, :update, :desroy, :create]

  def index
    @products = Product.all
    if params[:search]
      @products = Product.search(params[:search]).order("created_at DESC")
    else
      @products = Product.category_id(params[:category_id]) if params[:category_id].present?
    end
  end

  def show
    @pictures = @product.pictures.all
  end

  def new
    @product = Product.new
    @pictures = @product.pictures.build
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        params[:picture]['image'].each do |a|
          @picture = @product.pictures.create!(image: a, product_id: @product.id)
        end
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        if params[:picture] && params[:picture]['image']
          @product.pictures.delete_all
          params[:picture]['image'].each do |a|
            @picture = @product.pictures.create!(image: a, product_id: @product.id)
          end
        end
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end
    def prepare_categories
      @categories = Category.all
    end

    def product_params
      params.require(:product).permit(:title, :size, :long, :material, :price, :old_price, :sale, :description, :category_id, pictures_attributes: [:id, :product_id, :image])
    end
end
