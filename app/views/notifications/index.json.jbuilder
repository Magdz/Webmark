json.array!(@notifications) do |notification|
  json.extract! notification, :id, :sender_id, :category_id, :subcategory_id, :bookmark_id
  json.url notification_url(notification, format: :json)
end
