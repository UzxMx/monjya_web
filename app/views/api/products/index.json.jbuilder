json.array! @products do |p|
  json.extract! p, :id, :name, :brief_description, :address, :price, :thumb_photo_url
end