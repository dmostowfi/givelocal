json.extract! giftlist, :id, :user_id, :friend_name, :gift_id, :created_at,
              :updated_at
json.url giftlist_url(giftlist, format: :json)
