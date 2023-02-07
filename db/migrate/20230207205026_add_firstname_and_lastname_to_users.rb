class AddFirstnameAndLastnameToUsers < ActiveRecord::Migration[6.1]
  def up
    add_column :users, :first_name, :text
    add_column :users, :last_name, :text
  end

  def down
    remove_column :users, :first_name, :text
    remove_column :users, :last_name, :text
  end
end
