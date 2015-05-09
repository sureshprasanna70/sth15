json.array!(@mappings) do |mapping|
  json.extract! mapping, :id, :user_id, :post_id
  json.url mapping_url(mapping, format: :json)
end
