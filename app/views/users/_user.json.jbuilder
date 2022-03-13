json.extract! user, :id, :username, :password, :birthday, :interests, :address,
              :category_id, :postcard_id, :created_at, :updated_at
json.url user_url(user, format: :json)
