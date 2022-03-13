json.extract! postcard, :id, :postcard_image, :postcard_name, :description, :price, :delivery_time, :category_id, :bookmark_id, :user_id, :created_at, :updated_at
json.url postcard_url(postcard, format: :json)
