class AddLineLogin < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :line_id, :string
    add_column :users, :name, :string
    add_column :users, :image_url, :string
  end
end
