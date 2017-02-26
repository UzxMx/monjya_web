class Product < ApplicationRecord
  include Stateful
  belongs_to :thumb_photo, class_name: 'Photo'
  has_many :photos, class_name: 'ProductPhoto'

  accepts_nested_attributes_for :photos

  def thumb_photo_url(crop = '')
    thumb_photo ? thumb_photo.url(crop) : nil
  end
end
