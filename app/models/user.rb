class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :therapies
  has_many :animals, dependent: :destroy
  

  def owns?(animal)
    animal.user == self
  end

end
