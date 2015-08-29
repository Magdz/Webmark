json.array!(@followers) do |follower|
  json.extract! follower, :id, :follower_id, :followed_id
  json.url follower_url(follower, format: :json)
end
