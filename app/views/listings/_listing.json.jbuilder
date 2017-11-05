json.extract! listing, :id, :title, :category, :user_id, :images, :tags, :location, :description, :price, :created_at, :updated_at
json.url listing_url(listing, format: :json)
