class GiftlistResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer
  attribute :friend_name, :string
  attribute :gift_id, :integer

  # Direct associations

  belongs_to :gift

  belongs_to :user

  # Indirect associations

end
