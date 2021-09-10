json.extract! user, :id, :username, :email, :admin
json.url user_url(user, format: :json)
