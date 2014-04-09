json.array!(@bus_movements) do |bus_movement|
  json.extract! bus_movement, :id
  json.url bus_movement_url(bus_movement, format: :json)
end
