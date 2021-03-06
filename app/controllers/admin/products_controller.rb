class Admin::ProductsController < Admin::BaseController
  load_and_authorize_resource

  def index
    params[:q] ||= {state_not_eq: '2'}
    @q = Product.search(params[:q])
    @q.sorts = 'updated_at desc' if @q.sorts.empty?
    @products = @q.result.page(params[:page]).per(20)
  end

  def create
    product = Product.create(create_params)
    redirect_to edit_admin_product_path(product), notice: '操作成功'
  end

  def update
    @product.update_attributes(update_params)
    redirect_to :back, notice: '操作成功'
  end

  def create_photo
    ProductPhoto.create(product: @product)
    redirect_to :back, notice: '操作成功'
  end

  private
  def create_params
    params.require(:product).permit!
  end  

  def update_params
    params.require(:product).permit!
  end
end