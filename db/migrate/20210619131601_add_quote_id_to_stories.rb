class AddQuoteIdToStories < ActiveRecord::Migration[6.1]
  def change
    add_column :stories, :quote_id, :integer
  end
end
