class Item < ApplicationRecord
  validates :name, :path, presence: true
end
