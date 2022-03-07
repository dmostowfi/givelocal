class Gift < ApplicationRecord
  # Direct associations

  has_many   :wishes,
             :class_name => "MyWish",
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :category_id, :presence => true

  validates :description, :presence => true

  validates :gift_name, :presence => true

  validates :photo, :presence => true

  validates :store_id, :presence => true

  # Scopes

  def to_s
    gift_name
  end

end
