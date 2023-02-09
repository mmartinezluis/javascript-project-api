class User < ApplicationRecord
  has_secure_password
  has_many :stories, dependent: :destroy
  has_many :quotes, through: :stories
  validates_presence_of :fist_name, :last_name, :email, :password, on: :cretae
  validates :email, uniqueness: true, on: :create
  before_validation { self.email = email.downcase }

  # def data_for_profile 
  #   self.to_json(
  #     only: [:id, :first_name, :last_name, :email, :username],
  #     :inlclude => {
  #       :stories => {
  #         :include => {
  #           :quote => { only: [:id, :body, :author_id]}
  #         }
  #       }
  #     }
  #   )
  # end
end
