class ApplicationController < ActionController::Base
  before_action :set_locale, :authenticate_user!
  protect_from_forgery with: :exception
  helper_method :generate_qiniu_uptoken

  def set_locale
    I18n.locale = :'zh-CN'
  end

  def generate_qiniu_uptoken(attach_to_type, attach_to_id = '', callback_type = 'instance_update')
    put_policy = Qiniu::Auth::PutPolicy.new('monjya', nil, 8.hours.to_i)
    put_policy.callback_body = "callback_type=#{callback_type}&attach_to_type=#{attach_to_type}&attach_to_id=#{attach_to_id}&user_id=#{current_user.id}&w=$(imageInfo.width)&h=$(imageInfo.height)&s=$(fsize)&n=$(fname)"
    put_policy.callback_url = QINIU_CALLBACK_URL
    put_policy.callback_fetch_key = 1
    Qiniu::Auth::generate_uptoken(put_policy)
  end
end
