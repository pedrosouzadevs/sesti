class Session < ApplicationRecord
  belongs_to :user
  belongs_to :equip
  validates :info, presence: true
end
