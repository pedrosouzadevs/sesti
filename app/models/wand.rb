class Wand < ApplicationRecord
  has_many :weapons
  validates :name, :path, presence: true
end
