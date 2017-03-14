json.extract! order, :id, :oid, :start_date, :start_place, :visitors, :price, :status
json.product do
  json.extract! order.product, :id, :name
end