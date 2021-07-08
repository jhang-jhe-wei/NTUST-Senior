class AddLineNotifyTokenToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :line_notify_token, :string
  end
end
