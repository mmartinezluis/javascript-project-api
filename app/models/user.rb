class User < ApplicationRecord
  has_many :stories
  has_many :quotes, through: :stories
end
