class Admin < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :role, presence: true
  has_secure_password

  def admin?
    true
  end

  def super_admin?
    role == 'super_admin'
  end
end
