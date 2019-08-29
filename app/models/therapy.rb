class Therapy < ApplicationRecord
  belongs_to :user
  belongs_to :animal

  validates :start_on, :end_on, :overlap => {:scope => "animal_id"}
end
