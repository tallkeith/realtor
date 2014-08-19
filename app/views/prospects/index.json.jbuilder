json.array!(@prospects) do |prospect|
  json.extract! prospect, :id, :name, :email, :phone, :reason
  json.url prospect_url(prospect, format: :json)
end
