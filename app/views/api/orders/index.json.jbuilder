json.array! @orders do |order|
  json.partial! partial: 'show', locals: {order: order}
end