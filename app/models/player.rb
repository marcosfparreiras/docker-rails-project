class Player < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  belongs_to :plan
end
