class Product < ApplicationRecord
  include Stateful
  belongs_to :thumb_photo, class_name: 'Photo'
  has_many :product_photos
end
