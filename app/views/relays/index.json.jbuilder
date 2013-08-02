json.array!(@relays) do |relay|
  json.extract! relay, :name, :pin, :number
  json.url relay_url(relay, format: :json)
end
