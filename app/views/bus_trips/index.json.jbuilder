json.array!(@bus_trips) do |bus_trip|
  json.extract! bus_trip, :id
  json.url bus_trip_url(bus_trip, format: :json)
end
