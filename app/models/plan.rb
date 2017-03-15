class Plan < ApplicationRecord
  validates :name, presence: true
  validates :value, presence: true

  has_many :players
end
