class Author < ApplicationRecord
  has_many :quotes, autosave: true, dependent: :destroy

  def url_address
    "http://www.brainyquote.com/authors/" + self.name.downcase.gsub(" ", "-").gsub(".","") + "-quotes"
  end
end



