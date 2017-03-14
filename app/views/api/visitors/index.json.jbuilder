json.array! @visitors do |visitor|
  json.extract! visitor, :id, :name, :telephone
end