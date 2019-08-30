class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :therapies
  has_many :animals
  has_many :favorites, dependent: :destroy

  def owns?(animal)
    animal.user == self
  end

  def favorite(animal)
    favorites.find_or_create_by(animal: animal)
  end

  def unfavorite(animal)
    favorites.where(animal: animal).destroy_all
    animal.reload
  end

  def favorited?(animal)
    favorites.find_by(animal_id: animal.id).present?
  end
end
