json.array!(@sensors) do |sensor|
  json.extract! sensor, :name, :sensor_type, :pin, :number, :last_reading, :description
  json.url sensor_url(sensor, format: :json)
end
