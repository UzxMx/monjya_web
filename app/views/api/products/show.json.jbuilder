json.extract! @product, :id, :name, :brief_description, :address, :price, :thumb_photo_url
json.photos @product.photos.map {|photo| photo.photo.url}