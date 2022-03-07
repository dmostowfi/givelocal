class StoreResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :store_name, :string
  attribute :address, :string
  attribute :phone_number, :string
  attribute :email, :string
  attribute :password, :string

  # Direct associations

  has_many :gifts

  # Indirect associations
end
