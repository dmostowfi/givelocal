json.extract! store, :id, :store_name, :address, :phone_number, :created_at,
              :updated_at
json.url store_url(store, format: :json)
