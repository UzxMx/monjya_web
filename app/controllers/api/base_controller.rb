class Api::BaseController < ActionController::Base
  before_action :authenticate_user_from_token!

  protected
  def per_page
    per = params[:per].to_i
    per > 0 && per <= 100 ? per : 20
  end

  def authenticate_user_from_token!
    if auth_token = request.headers[:Authorization]
      user = User.find(auth_token.split(':').first)
      if user.auth_token == auth_token
        sign_in user, store: false
      end
    end
  end
end