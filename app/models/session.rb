class Session < ApplicationRecord
  belongs_to :user
  validates :info, presence: true
end
