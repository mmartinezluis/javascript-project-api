class CreateQuotes < ActiveRecord::Migration[6.1]
  def change
    create_table :quotes do |t|
      t.text :body
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
  end
end
