class ProductsController < ApplicationController
  before_action :find_product, only: [:show]
  before_action :find_category, only: [:index]

  def index
    if params[:category_id]
      @products = @category.products.paginate(page: params[:page],
      per_page: Settings.page_product_size).order(id: :asc)
    else
      @products = Product.paginate(page: params[:page],
      per_page: Settings.page_product_size).order(id: :asc)
    end
  end

  def show
  end

  private

  def find_product
    @product = Product.find(params[:id])
    unless @product
      flash[:danger] = t "not_found.product"
      redirect_to not_found_index_path
    end
  end

  def find_category

    @category = Category.find(params[:category_id]) if params[:category_id]
    unless @category
      flash[:danger] = t "not_found.category"
    end
  end
end
