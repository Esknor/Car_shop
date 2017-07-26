json.array!(@products) do |product|
  json.extract! product, :id, :name, :img, :text
  json.url product_url(product, format: :json)
end
