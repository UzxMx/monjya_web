class Api::UsersController < Api::BaseController
  skip_before_action :authenticate_user_from_token!, only: [:sign_up, :sign_in]

  def show
    
  end

  def sign_up_user
    if Authorization.exists?(provider_name: :username, provider_uid: params[:username])
      render json: {errno: 1}
      return
    end

    authorization = Authorization.create(provider_name: :username, provider_uid: params[:username])
    user = User.create(email: "#{params[:username]}@username.df.top", password: params[:password])
    authorization.update_attributes(user_id: user.id)  

    render json: {id: user.id, token: user.auth_token}
  end

  def sign_in_user
    if authorization = Authorization.find_by(provider_name: :username, provider_uid: params[:username]) and authorization.user.valid_password?(params[:password])
      render json: {id: authorization.user.id, token: authorization.user.auth_token}
    else
      render json: {errno: 1}
    end
  end

  def update
    
  end

  def set_travel_agent
    UserTravelAgent.find_or_create_by!(user_id: current_user.id).update_attributes(travel_agent_id: params[:travel_agent_id])
    render json: {}
  end
end