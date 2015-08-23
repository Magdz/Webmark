json.array!(@subcategories) do |subcategory|
  json.extract! subcategory, :id, :title
  json.url subcategory_url(subcategory, format: :json)
end
