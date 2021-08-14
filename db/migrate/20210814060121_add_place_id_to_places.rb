class AddPlaceIdToPlaces < ActiveRecord::Migration[6.1]
  def change
    add_column :places, :place_id, :string
  end
end
