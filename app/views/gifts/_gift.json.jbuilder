json.extract! gift, :id, :gift_name, :description, :photo, :store_id,
              :category_id, :price, :website, :created_at, :updated_at
json.url gift_url(gift, format: :json)
