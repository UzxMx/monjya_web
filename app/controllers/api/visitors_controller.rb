class Api::VisitorsController < Api::BaseController
  def index
    @visitors = current_user.visitors
  end

  def create
    visitor = current_user.visitors.create(params.permit(:name, :telephone))
    render json: {id: visitor.id, name: visitor.name, telephone: visitor.telephone}
  end

  def update
    current_user.visitors.find(params[:id]).update_attributes(params.permit(:name, :telephone))
    render json: {}
  end

  def destroy
    current_user.visitors.find(params[:id]).destroy
    render json: {}
  end
end