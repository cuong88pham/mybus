json.array!(@buses) do |bus|
  json.extract! bus, :id
  json.url bus_url(bus, format: :json)
end
