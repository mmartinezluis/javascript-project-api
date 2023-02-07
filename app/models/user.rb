class User < ApplicationRecord
  # has_secure_password
  has_many :stories, dependent: :destroy
  has_many :quotes, through: :stories
end
