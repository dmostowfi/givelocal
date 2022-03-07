class User < ApplicationRecord
  include JwtToken
  # Direct associations

  has_many   :giftlists,
             dependent: :destroy

  has_many   :wishlists,
             class_name: "MyWish",
             dependent: :destroy

  # Indirect associations

  has_many   :wished_gifts,
             through: :wishlists,
             source: :gift

  has_many   :gift_options,
             through: :giftlists,
             source: :gift

  # Validations

  # Scopes

  def to_s
    created_at
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
