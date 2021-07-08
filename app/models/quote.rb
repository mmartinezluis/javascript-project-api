class Quote < ApplicationRecord
  belongs_to :author
  has_and_belongs_to_many :categories
  has_many :stories
  has_many :users, through: :stories

  def author_name=(name)
    self.author.name = name
  end

  def author_name
    self.author ? self.author.name : nil
  end

  def category_name=(name)
    self.category.name = name
  end

  def category_name
    self.category ? self.category.name : nil
  end

end


