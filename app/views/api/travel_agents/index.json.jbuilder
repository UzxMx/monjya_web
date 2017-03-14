json.array! @travel_agents do |agent|
  json.extract! agent, :id, :name
end