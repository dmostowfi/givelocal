class Category < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :category, :inclusion => { :in => [ "Clothing", "Tech", "Experiences", "Food", "Books", "Travel" ]  }

  # Scopes

  def to_s
    category
  end

end
