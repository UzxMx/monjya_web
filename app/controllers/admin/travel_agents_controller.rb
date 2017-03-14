class Admin::TravelAgentsController < Admin::BaseController
  load_and_authorize_resource
  def index
    @q = TravelAgent.search(params[:q])
    @q.sorts = 'id desc' if @q.sorts.empty?
    @travel_agents = @q.result.page(params[:page]).per(20)
  end

  def create
    if @travel_agent.save
      redirect_to edit_admin_travel_agent_path(@travel_agent), notice: '操作成功'
    else
      flash[:alert] = '操作失败'
      render :new
    end
  end

  def update
    @travel_agent.update_attributes(update_params)
    redirect_to :back, notice: '操作成功'
  end

  private
  def create_params
    params.require(:travel_agent).permit!
  end

  def update_params
    params.require(:travel_agent).permit!
  end
end