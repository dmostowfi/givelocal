class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :name, :string

  # Direct associations

  has_many   :giftlists

  has_many   :wishlists,
             resource: MyWishResource

  # Indirect associations

  many_to_many :wished_gifts,
               resource: GiftResource

  many_to_many :gift_options,
               resource: GiftResource
end
