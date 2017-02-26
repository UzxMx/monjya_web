json.extract! @product, :id, :name, :brief_description, :address, :price, :thumb_photo_url, :open_time, :details, :journey, :play_method
json.photos @product.photos.map {|photo| photo.photo.url}