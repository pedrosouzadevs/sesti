class Creature < ApplicationRecord
  validates :name, :path, presence: true
end
