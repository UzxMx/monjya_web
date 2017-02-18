class Admin::UsersController < Admin::BaseController
  load_and_authorize_resource

  def index
    @q = User.search(params[:q])
    @q.sorts = 'id desc' if @q.sorts.empty?
    @users = @q.result.page(params[:page]).per(20)    
  end

  def create
    # TODO validate
    User.create(create_params)
    redirect_to admin_users_path
  end

  def update
    # TODO disable email when editing
    @user.update_attributes(update_params)
    redirect_to :back, notice: '操作成功'   
  end

  private
  def create_params
    params.require(:user).permit!
  end

  def update_params
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    params.require(:user).permit!
  end   
end