class CreateCategoriesQuotesJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :categories, :quotes do |t|
      t.index :quote_id
      t.index :category_id
    end  
  end
end
