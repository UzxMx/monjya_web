class Api::ProductsController < Api::BaseController
  def index
    @products = Product.select(:id, :name, :brief_description, :address, :price, :thumb_photo_id).where(state: 1).order(updated_at: :desc).page(params[:page]).per(per_page)
  end

  def show
    @product = Product.find(params[:id])
  end
end