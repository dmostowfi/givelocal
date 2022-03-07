class GiftResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :gift_name, :string
  attribute :description, :string
  attribute :photo, :string
  attribute :store_id, :integer
  attribute :category_id, :integer

  # Direct associations

  belongs_to :store

  has_many   :giftlists

  has_many   :wishes,
             resource: MyWishResource

  # Indirect associations

end
