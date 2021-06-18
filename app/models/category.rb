class Category < ApplicationRecord
  has_many :authors
  has_and_belongs_to_many :quotes, autosave: true

  def url_address
    "http://brainyquotes.com/topics/" + self.name + "-quotes"
  end

end
