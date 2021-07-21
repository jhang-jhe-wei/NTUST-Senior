class RemoveUserEmailUnique < ActiveRecord::Migration[6.1]
  def up
    change_column :users, :email, :string, null: true, default: nil
  end
  def down
    change_column_null :users, :email, false, SecureRandom.uuid
  end
end
