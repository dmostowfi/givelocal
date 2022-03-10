require "open-uri"
class Gift < ApplicationRecord
  before_validation :geocode_photo

  def geocode_photo
    if photo.present?
      url = "https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV['GMAP_API_KEY']}&address=#{URI.encode(photo)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.photo_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.photo_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.photo_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
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
