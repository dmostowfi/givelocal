class Giftlist < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :friend_name, :presence => true

  validates :gift_id, :presence => true

  validates :user_id, :presence => true

  # Scopes

  def to_s
    user.to_s
  end

end
