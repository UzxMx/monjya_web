class Api::QiniuController < ActionController::Base
  def callback
    key = [params[:attach_to_type], params[:attach_to_id], Digest::MD5.hexdigest(params[:n] + Time.now.to_f.to_s) + '.jpg'].reject(&:blank?).join("/")
    photo = Photo.create(key: key, width: params[:w], height: params[:h], file_size: params[:s], user_id: params[:user_id])
    if params[:attach_to_type].present? && params[:attach_to_id].present?
      target = params[:attach_to_type].camelize.constantize.find(params[:attach_to_id])
      if params[:callback_type] == 'instance_update'
        target.update_attributes(photo: photo)
      elsif target.respond_to?(params[:callback_type])
        target.send(params[:callback_type]).create(photo: photo)
      end
    end
    render json: {key: key, payload: {url: photo.url, id: photo.id}}    
  end
end