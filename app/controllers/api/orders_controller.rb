class Api::OrdersController < Api::BaseController
  def index
    @orders = current_user.orders.order(created_at: :desc).page(params[:page]).per(params[:per])
  end

  def ongoing
    @orders = current_user.orders.where('start_date >= ?', DateTime.now.beginning_of_day).order(start_date: :desc).page(params[:page]).per(params[:per])
    render 'index'
  end

  def create
    visitors = current_user.visitors.where(id: params[:visitor_ids]).as_json(only: [:name, :telephone])

    @order = Order.create(params.require(:order).merge!(visitors: visitors, user_id: current_user.id, price: visitors.size * Product.find(params[:product_id]).price, status: :new_created, oid: generate_oid).permit!)

    render 'show'
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  private
  def generate_oid
    oid = nil
    loop do
      break if !Order.exists?(oid: oid = Time.now.strftime("%Y%m%d%H%M%S") + (0..9).to_a.sample(4).join)
    end
    oid
  end
end