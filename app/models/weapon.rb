class Weapon < ApplicationRecord
  validates :name, :path, :job, presence: true
  has_many :equips
  belongs_to :rod, optional: true
  belongs_to :wand, optional: true
  belongs_to :distance, optional: true
  belongs_to :axe, optional: true
  belongs_to :club, optional: true
  belongs_to :sword, optional: true

  has_many :rods, dependent: :destroy
  has_many :wands, dependent: :destroy
  has_many :distances, dependent: :destroy
  has_many :axes, dependent: :destroy
  has_many :clubs, dependent: :destroy
  has_many :swords, dependent: :destroy
end
