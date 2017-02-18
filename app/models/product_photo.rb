class ProductPhoto < ApplicationRecord
  include HasPhoto
  belongs_to :product
end
