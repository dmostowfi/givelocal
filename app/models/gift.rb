class Gift < ApplicationRecord
  mount_base64_uploader :photo, PhotoUploader

  # Direct associations

  belongs_to :category

  belongs_to :store

  has_many   :giftlists,
             dependent: :destroy

  has_many   :wishes,
             class_name: "MyWish",
             dependent: :destroy

  # Indirect associations

  has_many   :wishers,
             through: :wishes,
             source: :user

  has_many   :interested_friends,
             through: :giftlists,
             source: :user

  # Validations

  validates :category_id, presence: true

  validates :description, presence: true

  validates :gift_name, presence: true

  validates :photo, presence: true

  validates :store_id, presence: true

  # Scopes

  def to_s
    gift_name
  end
end
