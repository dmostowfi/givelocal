json.extract! my_wish, :id, :user_id, :gift_id, :created_at, :updated_at
json.url my_wish_url(my_wish, format: :json)
