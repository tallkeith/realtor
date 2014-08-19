json.array!(@properties) do |property|
  json.extract! property, :id, :address
  json.url property_url(property, format: :json)
end
