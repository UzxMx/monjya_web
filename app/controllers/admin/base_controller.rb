class Admin::BaseController < ApplicationController
  before_action :check_user_role
  layout "admin"

  def check_user_role
    redirect_to home_path unless current_user.admin?
  end
end