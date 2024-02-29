class Quiver < ApplicationRecord
  has_many :equips
  validates :name, :path, presence: true
end
