module HasPhoto
  extend ActiveSupport::Concern

  included do
    belongs_to :photo
  end

  def photo_url(crop = '')
    photo ? photo.url(crop) : nil
  end
end