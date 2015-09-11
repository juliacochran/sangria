json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :seeking, :settings
  json.url user_url(user, format: :json)
end
