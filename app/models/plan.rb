class Plan < ApplicationRecord
  validates :name, presence: true
  validates :value, presence: true

  has_many :players

  def formated_plan
    "#{name} - R$ #{value}"
  end
end
