class AddAuthorNameToQuote < ActiveRecord::Migration[6.1]
  def up
    add_column :quotes, :author_name, :string
  end
  
  def down
    remove_column :quotes, :author_name, :string
  end
end
