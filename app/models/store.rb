class Store < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    store_name
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
