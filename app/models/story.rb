class Story < ApplicationRecord
  belongs_to :user
  belongs_to :quote

  validates :description, presence: true
end
