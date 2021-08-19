class RemovePlaceId < ActiveRecord::Migration[6.1]
  def change
    remove_column :places, :id
    rename_column :places, :place_id, :id
    execute "ALTER TABLE places ADD PRIMARY KEY (id);"
  end
end
