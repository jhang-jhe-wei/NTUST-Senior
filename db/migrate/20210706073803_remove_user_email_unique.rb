class RemoveUserEmailUnique < ActiveRecord::Migration[6.1]
  def change
    remove_index :users, :email
    change_column :users, :email, :string, unique: false
    add_index :users, :email
  end
end
