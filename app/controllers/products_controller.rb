class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    if params[:category_id].present?
      @products = Product.category_id(params[:category_id]) 
    else
      @products = Product.all
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
          @product.picture.delete_all
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
      params.require(:product).permit(:title, :description, :category_id, pictures_attributes: [:id, :product_id, :image])
    end
end
