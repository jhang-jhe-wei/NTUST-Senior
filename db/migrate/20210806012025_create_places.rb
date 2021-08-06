class CreatePlaces < ActiveRecord::Migration[6.1]
  def change
    create_table :places do |t|
      t.string :photo
      t.string :name
      t.string :star
      t.string :address
      t.string :google_map_url

      t.timestamps
    end
  end
end
