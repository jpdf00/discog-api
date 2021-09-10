json.extract! user, :id, :username, :email, :avatar
json.url user_url(user, format: :json)
