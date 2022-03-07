class Store < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :address, :presence => true

  validates :phone_number, :uniqueness => true

  validates :phone_number, :presence => true

  validates :store_name, :uniqueness => true

  validates :store_name, :presence => true

  # Scopes

  def to_s
    store_name
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
