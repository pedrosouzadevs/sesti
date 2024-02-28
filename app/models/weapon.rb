class Weapon < ApplicationRecord
  validates :job, presence: true
  # , inclusion: { in: [1, 2, 3, 4, 5, 6] }
  has_many :equips
  belongs_to :rod, optional: true
  belongs_to :wand, optional: true
  belongs_to :distance, optional: true
  belongs_to :axe, optional: true
  belongs_to :club, optional: true
  belongs_to :sword, optional: true

  # private

  # def validate_association_presence
  #   case type
  #   when 1
  #     errors.add(:rod, "must be present") if rod.nil?
  #   when 2
  #     errors.add(:wand, "must be present") if wand.nil?
  #   when 3
  #     errors.add(:distance, "must be present") if distance.nil?
  #   when 4
  #     errors.add(:axe, "must be present") if axe.nil?
  #   when 5
  #     errors.add(:club, "must be present") if club.nil?
  #   when 6
  #     errors.add(:sword, "must be present") if sword.nil?
  #   end
  # end
end
