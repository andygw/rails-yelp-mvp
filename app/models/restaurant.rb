class Restaurant < ApplicationRecord
  has_many :reviews

  validates :name, presence: true
  validates :address, presence: true
  validates :category, presence: true
end
