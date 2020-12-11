json.extract! user, :id, :name, :username, :bio, :email, :phone_number, :password, :created_at, :updated_at
json.url user_url(user, format: :json)
