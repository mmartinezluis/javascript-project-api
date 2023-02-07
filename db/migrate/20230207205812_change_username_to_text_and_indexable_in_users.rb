class ChangeUsernameToTextAndIndexableInUsers < ActiveRecord::Migration[6.1]
    def up
      change_column :users, :username, :text
      add_index :users, :username, unique: true
    end
  
    def down
      change_column :users, :username, :string
      remove_index :users, :username, unique: true
    end
end
