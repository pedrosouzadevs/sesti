class Equip < ApplicationRecord
  has_many :sessions
  belongs_to :helmet
  belongs_to :armor
  belongs_to :leg
  belongs_to :ring
  belongs_to :necklace
  belongs_to :boot
  belongs_to :quiver
  belongs_to :weapon
  belongs_to :user
end
