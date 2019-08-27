class Review < ApplicationRecord
  belongs_to :animal

  validates :rating, presence: true, inclusion: { in: (0..5) }
  validates :description, presence: true
end
