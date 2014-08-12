json.array!(@users) do |user|
  json.extract! user, :id, :username, :email, :name
  json.url user_url(user, format: :json)
end
