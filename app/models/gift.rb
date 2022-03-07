class Gift < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :photo, :presence => true

  validates :store_id, :presence => true

  # Scopes

  def to_s
    gift_name
  end

end
