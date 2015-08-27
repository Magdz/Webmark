json.array!(@remarks) do |remark|
  json.extract! remark, :id, :bookmark_id, :body, :user_id
  json.url remark_url(remark, format: :json)
end
